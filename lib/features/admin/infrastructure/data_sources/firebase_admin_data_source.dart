import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/NotFoundError.dart';
import 'package:jews_harp/core/extensions.dart';
import 'package:jews_harp/features/admin/infrastructure/DTO/category_localized_data_DTO.dart';
import 'package:jews_harp/features/admin/infrastructure/DTO/technique_localized_data_DTO.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/category_DTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/mediaDTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/technique_DTO.dart';
import 'package:light_compressor/light_compressor.dart';
import 'package:optional/optional.dart';
import 'package:path_provider/path_provider.dart';

/// Firebase Admin Section data source
@LazySingleton(env: [Environment.prod])
class FirebaseAdminDataSource {
  /// Category collection
  CollectionReference _categories = FirebaseFirestore.instance.collection('categories');

  /// Technique collection
  CollectionReference _techniques = FirebaseFirestore.instance.collection('techniques');

  /// Cloud storage technique location
  Reference _techniqueMedia = FirebaseStorage.instance.ref("techniques");

  /// Cloud storage categories location
  Reference _categoryMedia = FirebaseStorage.instance.ref("categories");

  /// Compress and upload the file to cloud storage
  Future<String> _uploadFile(Reference media, String techniqueId, String filename, String path) async {
    // get temporary directory
    final tmp = await getTemporaryDirectory();
    final filePath = tmp.path + "/compressedVideo";
    // Compress the file
    final response = await LightCompressor.compressVideo(
      path: path,
      destinationPath: filePath,
      videoQuality: VideoQuality.medium,
      isMinBitRateEnabled: false,
      keepOriginalResolution: false,
    );

    // Upload the file to cloud storage
    final compressedFile = File(response!['onSuccess']);
    final task = await media.child(techniqueId).child(filename).putFile(compressedFile);
    final url = await task.ref.getDownloadURL();

    // Delete the file
    compressedFile.delete();

    return url;
  }

  /// Delete the file from cloud storage if it exists
  Future<void> _deleteFile(Reference media, String techniqueId, String filename) async {
    try {
      await media.child(techniqueId).child(filename).delete();
    } catch (exception) {}
  }

  /// Map iterable of [categoryLocalizedDataDTO] to Map
  Map<String, dynamic> _createCategoryL10nFromIterable(Iterable<CategoryLocalizedDataDTO> data) {
    final Map<String, dynamic> l10n = {};
    data.forEach((e) {
      l10n[e.languageCode] = {
        "description": e.description,
        "title": e.title,
      };
    });

    return l10n;
  }

  /// Map iterable of [TechniqueLocalizedDataDTO] to Map
  Map<String, dynamic> _createTechniqueL10nFromIterable(Iterable<TechniqueLocalizedDataDTO> data) {
    final Map<String, dynamic> l10n = {};
    data.forEach((e) {
      l10n[e.languageCode] = {
        "title": e.title,
        "description": e.description,
        "accompanyingText": e.accompanyingText,
      };
    });
    return l10n;
  }

  /// Save a new technique document to Firestore
  Future<TechniqueDTO> createTechnique({
    required Optional<String> productId,
    required String categoryId,
    required TechniqueDifficulty difficulty,
    required Iterable<TechniqueLocalizedDataDTO> localizedData,
    required Optional<MediaDTO> thumbnail,
    required Optional<MediaDTO> video,
  }) async {
    // Check if category exists.
    final category = await _categories.doc(categoryId).get();
    if (!category.exists) throw NotFoundError("Category with given ID was not found!");

    // Save to Firestore
    final snapshot = await _techniques.add({
      "productId": productId.toNullable(),
      "category": categoryId,
      "difficulty": difficulty.index,
      "localization": _createTechniqueL10nFromIterable(localizedData),
      "datePublished": category["isVisible"] as bool ? FieldValue.serverTimestamp() : null,
    });

    // Upload video if provided.
    if (video.isPresent && video.value.filePath.isPresent) {
      await _uploadFile(_techniqueMedia, snapshot.id, "video", video.value.filePath.value);
    }

    // Upload thumbnail ifi provided.
    if (thumbnail.isPresent && thumbnail.value.filePath.isPresent) {
      await _uploadFile(_techniqueMedia, snapshot.id, "thumbnail", thumbnail.value.filePath.value);
    }

    // Update techniques of the given category.
    category.reference.update({
      "techniques": FieldValue.arrayUnion([snapshot.id])
    });

    return TechniqueDTO.fromFirestore(await snapshot.get());
  }

  /// Save a new category to Firestore database.
  Future<CategoryDTO> createCategory(
    bool isVisible,
    Optional<MediaDTO> thumbnail,
    Iterable<CategoryLocalizedDataDTO> localizedData,
  ) async {
    // Save to Firestore
    final snapshot = await _categories.add({
      "isVisible": isVisible,
      "techniques": FieldValue.arrayUnion([]),
      "localization": _createCategoryL10nFromIterable(localizedData),
    }).then((value) => value.get());

    // Upload thumbnail if provided.
    if (thumbnail.isPresent && thumbnail.value.filePath.isPresent) {
      await _uploadFile(_categoryMedia, snapshot.id, "thumbnail", thumbnail.value.filePath.value);
    }

    return CategoryDTO.fromFirestore(snapshot);
  }

  /// Update and save new category data to Firestore database.
  Future<CategoryDTO> updateCategory(
    String id, {
    bool? isVisible,
    Optional<MediaDTO>? thumbnail,
    Iterable<CategoryLocalizedDataDTO>? localizedData,
  }) async {
    // Check if category exists.
    final category = await _categories.doc(id).get();
    if (!category.exists) throw NotFoundError("Category with the given ID doesn't exist!");

    final Map<String, dynamic> updatedData = {};

    // set category to visible and publish all contained techniques.
    if (isVisible != null) {
      updatedData["isVisible"] = isVisible;

      // Set [datePublished] to server time
      if (isVisible == true) {
        final techniqueIds = List<String>.from(category["techniques"]);
        for (String id in techniqueIds) {
          final technique = await _techniques.doc(id).get();
          if (technique["datePublished"] == null) technique.reference.update({"datePublished": FieldValue.serverTimestamp()});
        }
      }
    }

    // Update localization
    if (localizedData != null) {
      updatedData["localization"] = _createCategoryL10nFromIterable(localizedData);
    }

    // Update category.
    await _categories.doc(id).update(updatedData);

    // Update thumbnail.
    if (thumbnail != null) {
      if (thumbnail.isEmpty) {
        // Delete the old one.
        await _deleteFile(_categoryMedia, id, "thumbnail");
      } else if (thumbnail.isPresent && thumbnail.value.filePath.isPresent) {
        // Upload new file.
        await _uploadFile(_categoryMedia, id, "thumbnail", thumbnail.value.filePath.value);
      }
    }

    return CategoryDTO.fromFirestore(await _categories.doc(id).get());
  }

  /// Update and save new technique data to Firestore database.
  Future<TechniqueDTO> updateTechnique(
    String id, {
    Optional<String>? productId,
    String? categoryId,
    TechniqueDifficulty? difficulty,
    Iterable<TechniqueLocalizedDataDTO>? localizedData,
    Optional<MediaDTO>? thumbnail,
    Optional<MediaDTO>? video,
  }) async {
    // Check if technique exists.
    final technique = await _techniques.doc(id).get();
    if (!technique.exists) throw NotFoundError("Technique with the given ID doesn't exist!");

    final Map<String, dynamic> updatedData = {};

    if (productId != null) updatedData["productId"] = productId.toNullable();

    if (categoryId != null) {
      updatedData["category"] = categoryId;

      // Remove the technique ID from the old category
      _categories.doc(technique["category"] as String).update({
        "techniques": FieldValue.arrayRemove([id])
      });

      // Add the technique ID to the new category
      _categories.doc(categoryId).update({
        "techniques": FieldValue.arrayUnion([id])
      });
    }

    // Update technique difficulty.
    if (difficulty != null) updatedData["difficulty"] = difficulty.index;

    // Update localization.
    if (localizedData != null) updatedData["localization"] = _createTechniqueL10nFromIterable(localizedData);

    // Update thumbnail.
    if (thumbnail != null) {
      if (thumbnail.isEmpty) {
        // Delete the old thumbnail.
        await _deleteFile(_techniqueMedia, id, "thumbnail");
      } else if (thumbnail.isPresent && thumbnail.value.filePath.isPresent) {
        // Upload the new one.
        await _uploadFile(_techniqueMedia, id, "thumbnail", thumbnail.value.filePath.value);
      }
    }

    // Update video.
    if (video != null) {
      if (video.isEmpty) {
        // Delete the old video.
        await _deleteFile(_techniqueMedia, id, "video");
      } else if (video.isPresent && video.value.filePath.isPresent) {
        // Upload the new one.
        await _uploadFile(_techniqueMedia, id, "video", video.value.filePath.value);
      }
    }

    // Update technique.
    await _techniques.doc(id).update(updatedData);

    return TechniqueDTO.fromFirestore(await _techniques.doc(id).get());
  }

  /// Get hidden categories.
  Future<Iterable<CategoryDTO>> getHiddenCategories() async {
    final snapshot = await _categories.where("isVisible", isEqualTo: false).get();
    final List<CategoryDTO> res = [];

    for (final document in snapshot.docs) res.add(await CategoryDTO.fromFirestore(document));

    return res;
  }

  /// Get all categories.
  Future<Iterable<CategoryDTO>> getAllCategories() async {
    final snapshot = await _categories.get();
    final List<CategoryDTO> res = [];

    for (final document in snapshot.docs) res.add(await CategoryDTO.fromFirestore(document));

    return res;
  }

  /// Get all techniques.
  Future<Iterable<TechniqueDTO>> getAllTechniques() async {
    final snapshot = await _techniques.get();
    final List<TechniqueDTO> res = [];

    for (final doc in snapshot.docs) {
      res.add(await TechniqueDTO.fromFirestore(doc));
    }

    return res;
  }

  /// Get categoy localized data from category document.
  Future<Map<String, CategoryLocalizedDataDTO>> getCategoryLocalizedData(String categoryId) async {
    final category = await _categories.doc(categoryId).get();

    if (!category.exists) throw NotFoundError("Category with given ID was not found!");

    return CategoryLocalizedDataDTO.getLocalizedData(category);
  }

  /// Get technique localized data from technique document
  Future<Map<String, TechniqueLocalizedDataDTO>> getTechniqueLocalizedData(String techniqueId) async {
    final technique = await _techniques.doc(techniqueId).get();

    if (!technique.exists) throw NotFoundError("Technique with given ID was not found!");

    return TechniqueLocalizedDataDTO.getLocalizedData(technique);
  }
}
