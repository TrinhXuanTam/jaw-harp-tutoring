import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/NotFoundError.dart';
import 'package:jews_harp/core/errors/technique_already_exists_error.dart';
import 'package:jews_harp/core/extensions.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/category_DTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/category_localized_data_DTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/mediaDTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/technique_DTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/technique_localized_data_DTO.dart';
import 'package:light_compressor/light_compressor.dart';
import 'package:optional/optional.dart';
import 'package:path_provider/path_provider.dart';

@LazySingleton(env: [Environment.prod])
class FirebaseAdminDataSource {
  CollectionReference _categories = FirebaseFirestore.instance.collection('categories');
  CollectionReference _techniques = FirebaseFirestore.instance.collection('techniques');
  Reference _techniqueMedia = FirebaseStorage.instance.ref("techniques");
  Reference _categoryMedia = FirebaseStorage.instance.ref("categories");

  Future<String> _uploadFile(Reference media, String techniqueId, String filename, String path) async {
    final tmp = await getTemporaryDirectory();

    print("started");

    final response = await LightCompressor.compressVideo(
      path: path,
      destinationPath: tmp.path + "/compressedVideo",
      videoQuality: VideoQuality.medium,
      isMinBitRateEnabled: false,
      keepOriginalResolution: false,
    );

    print(response);

    final task = await media.child(techniqueId).child(filename).putFile(File(response!['onSuccess']));
    final url = await task.ref.getDownloadURL();
    return url;
  }

  Future<void> _deleteFile(Reference media, String techniqueId, String filename) async {
    try {
      await media.child(techniqueId).child(filename).delete();
    } catch (exception) {}
  }

  Future<TechniqueDTO> createTechnique({
    required Optional<String> productId,
    required String categoryId,
    required TechniqueDifficulty difficulty,
    required Iterable<TechniqueLocalizedDataDTO> localizedData,
    required Optional<MediaDTO> thumbnail,
    required Optional<MediaDTO> video,
  }) async {
    final category = await _categories.doc(categoryId).get();
    if (productId.isPresent) {
      final techniquesWithSameProductId = await _techniques.where("productId", isEqualTo: productId.value).get();
      if (techniquesWithSameProductId.size > 0) throw TechniqueAlreadyExistsError();
    } else if (!category.exists) throw NotFoundError("Category with given ID was not found!");

    final snapshot = await _techniques.add({
      "productId": productId.toNullable(),
      "category": categoryId,
      "difficulty": difficulty.index,
      "localization": localizedData.toJson(),
      "datePublished": category["isVisible"] as bool ? FieldValue.serverTimestamp() : null,
    });

    if (video.isPresent && video.value.filePath.isPresent) await _uploadFile(_techniqueMedia, snapshot.id, "video", video.value.filePath.value);
    if (thumbnail.isPresent && thumbnail.value.filePath.isPresent) await _uploadFile(_techniqueMedia, snapshot.id, "thumbnail", thumbnail.value.filePath.value);

    category.reference.update({
      "techniques": FieldValue.arrayUnion([snapshot.id])
    });

    return TechniqueDTO.fromFirestore(await snapshot.get());
  }

  Future<CategoryDTO> createCategory(
    bool isVisible,
    Optional<MediaDTO> thumbnail,
    Iterable<CategoryLocalizedDataDTO> localizedData,
  ) async {
    final snapshot = await _categories.add({
      "isVisible": isVisible,
      "techniques": FieldValue.arrayUnion([]),
      "localization": localizedData.toJson(),
    }).then((value) => value.get());

    if (thumbnail.isPresent && thumbnail.value.filePath.isPresent) await _uploadFile(_categoryMedia, snapshot.id, "thumbnail", thumbnail.value.filePath.value);

    return CategoryDTO.fromFirestore(snapshot);
  }

  Future<CategoryDTO> updateCategory(
    String id, {
    bool? isVisible,
    Optional<MediaDTO>? thumbnail,
    Iterable<CategoryLocalizedDataDTO>? localizedData,
  }) async {
    final category = await _categories.doc(id).get();
    final Map<String, dynamic> updatedData = {};

    if (!category.exists) throw NotFoundError("Category with the given ID doesn't exist!");

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

    if (localizedData != null) updatedData["localization"] = localizedData.toJson();

    if (thumbnail != null) {
      await _deleteFile(_categoryMedia, id, "thumbnail");

      if (thumbnail.isPresent && thumbnail.value.filePath.isPresent) await _uploadFile(_categoryMedia, id, "thumbnail", thumbnail.value.filePath.value);
    }

    await _categories.doc(id).update(updatedData);

    return CategoryDTO.fromFirestore(await _categories.doc(id).get());
  }

  Future<TechniqueDTO> updateTechnique(
    String id, {
    Optional<String>? productId,
    String? categoryId,
    TechniqueDifficulty? difficulty,
    Iterable<TechniqueLocalizedDataDTO>? localizedData,
    Optional<MediaDTO>? thumbnail,
    Optional<MediaDTO>? video,
  }) async {
    final technique = await _techniques.doc(id).get();
    final Map<String, dynamic> updatedData = {};

    if (!technique.exists) throw NotFoundError("Technique with the given ID doesn't exist!");

    if (productId != null) updatedData["productId"] = productId.toNullable();

    if (categoryId != null) {
      // Remove the technique ID from the old category
      _categories.doc(technique["category"] as String).update({
        "techniques": FieldValue.arrayRemove([id])
      });

      // Add the technique ID to the new category
      _categories.doc(categoryId).update({
        "techniques": FieldValue.arrayUnion([id])
      });

      updatedData["category"] = categoryId;
    }

    if (difficulty != null) updatedData["difficulty"] = difficulty.index;

    print(localizedData);

    if (localizedData != null) updatedData["localization"] = localizedData.toJson();

    if (thumbnail != null) {
      await _deleteFile(_techniqueMedia, id, "thumbnail");

      if (thumbnail.isPresent && thumbnail.value.filePath.isPresent) await _uploadFile(_techniqueMedia, id, "thumbnail", thumbnail.value.filePath.value);
    }

    if (video != null) {
      await _deleteFile(_techniqueMedia, id, "video");

      if (video.isPresent && video.value.filePath.isPresent) await _uploadFile(_techniqueMedia, id, "video", video.value.filePath.value);
    }

    await _techniques.doc(id).update(updatedData);

    return TechniqueDTO.fromFirestore(await _techniques.doc(id).get());
  }

  Future<Iterable<CategoryDTO>> getHiddenCategories() async {
    final snapshot = await _categories.where("isVisible", isEqualTo: false).get();
    final List<CategoryDTO> res = [];

    for (final document in snapshot.docs) res.add(await CategoryDTO.fromFirestore(document));

    return res;
  }

  Future<Iterable<CategoryDTO>> getAllCategories() async {
    final snapshot = await _categories.get();
    final List<CategoryDTO> res = [];

    for (final document in snapshot.docs) res.add(await CategoryDTO.fromFirestore(document));

    return res;
  }

  Future<Iterable<TechniqueDTO>> getAllTechniques() async {
    final snapshot = await _techniques.get();
    final List<TechniqueDTO> res = [];

    for (final doc in snapshot.docs) {
      res.add(await TechniqueDTO.fromFirestore(doc));
    }

    return res;
  }

  Future<Map<String, CategoryLocalizedDataDTO>> getCategoryLocalizedData(String categoryId) async {
    final category = await _categories.doc(categoryId).get();

    if (!category.exists) throw NotFoundError("Category with given ID was not found!");

    return CategoryLocalizedDataDTO.getLocalizedData(category);
  }

  Future<Map<String, TechniqueLocalizedDataDTO>> getTechniqueLocalizedData(String techniqueId) async {
    final technique = await _techniques.doc(techniqueId).get();

    if (!technique.exists) throw NotFoundError("Technique with given ID was not found!");

    return TechniqueLocalizedDataDTO.getLocalizedData(technique);
  }
}
