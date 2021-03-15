import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/NotFoundError.dart';
import 'package:jews_harp/core/errors/technique_already_exists_error.dart';
import 'package:jews_harp/core/extensions.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/category_DTO.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/category_localized_data_DTO.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/mediaDTO.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/technique_DTO.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/technique_localized_data_DTO.dart';
import 'package:optional/optional.dart';

@LazySingleton(env: [Environment.prod])
class FirebaseAdminDataSource {
  CollectionReference _categories = FirebaseFirestore.instance.collection('categories');
  CollectionReference _techniques = FirebaseFirestore.instance.collection('techniques');
  Reference _media = FirebaseStorage.instance.ref("techniques");

  Future<String> _uploadFile(String techniqueId, String filename, String path) async {
    final task = await _media.child(techniqueId).child(filename).putFile(File(path));
    final url = await task.ref.getDownloadURL();
    return url;
  }

  Future<void> _deleteFile(String techniqueId, String filename) async {
    try {
      await _media.child(techniqueId).child(filename).delete();
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
    if (productId.isPresent) {
      final techniquesWithSameProductId = await _techniques.where("productId", isEqualTo: productId.value).get();
      if (techniquesWithSameProductId.size > 0) throw TechniqueAlreadyExistsError();
    }

    final snapshot = await _techniques.add({
      "productId": productId.toNullable(),
      "category": categoryId,
      "difficulty": difficulty.index,
      "localization": localizedData.toJson(),
    });

    if (video.isPresent && video.value.filePath.isPresent) await _uploadFile(snapshot.id, "video", video.value.filePath.value);
    if (thumbnail.isPresent && thumbnail.value.filePath.isPresent) await _uploadFile(snapshot.id, "thumbnail", thumbnail.value.filePath.value);

    _categories.doc(categoryId).update({
      "techniques": FieldValue.arrayUnion([snapshot.id])
    });

    return TechniqueDTO.fromFirestore(await snapshot.get());
  }

  Future<CategoryDTO> createCategory(bool isVisible, Iterable<CategoryLocalizedDataDTO> localizedData) async {
    final snapshot = await _categories.add({
      "isVisible": isVisible,
      "techniques": FieldValue.arrayUnion([]),
      "localization": localizedData.toJson(),
    }).then((value) => value.get());

    return CategoryDTO.fromFirestore(snapshot);
  }

  Future<CategoryDTO> updateCategory(
    String id, {
    bool? isVisible,
    Iterable<CategoryLocalizedDataDTO>? localizedData,
  }) async {
    final category = await _categories.doc(id).get();
    final Map<String, dynamic> updatedData = {};

    if (!category.exists) throw NotFoundError("Category with the given ID doesn't exist!");

    if (isVisible != null) updatedData["isVisible"] = isVisible;
    if (localizedData != null) updatedData["localization"] = localizedData.toJson();

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
      await _deleteFile(id, "thumbnail");

      if (thumbnail.isPresent && thumbnail.value.filePath.isPresent) await _uploadFile(id, "thumbnail", thumbnail.value.filePath.value);
    }

    if (video != null) {
      await _deleteFile(id, "video");

      if (video.isPresent && video.value.filePath.isPresent) await _uploadFile(id, "video", video.value.filePath.value);
    }

    await _techniques.doc(id).update(updatedData);

    return TechniqueDTO.fromFirestore(await _techniques.doc(id).get());
  }

  Future<Iterable<CategoryDTO>> getVisibleCategories() async {
    final snapshot = await _categories.where("isVisible", isEqualTo: true).get();
    return snapshot.docs.map((e) => CategoryDTO.fromFirestore(e));
  }

  Future<Iterable<CategoryDTO>> getHiddenCategories() async {
    final snapshot = await _categories.where("isVisible", isEqualTo: false).get();
    return snapshot.docs.map((e) => CategoryDTO.fromFirestore(e));
  }

  Future<Iterable<CategoryDTO>> getAllCategories() async {
    final snapshot = await _categories.get();
    return snapshot.docs.map((e) => CategoryDTO.fromFirestore(e));
  }

  Future<Iterable<TechniqueDTO>> getAllTechniques() async {
    final snapshot = await _techniques.get();
    final List<TechniqueDTO> res = [];

    for (final doc in snapshot.docs) {
      res.add(await TechniqueDTO.fromFirestore(doc));
    }

    return res;
  }

  Future<Iterable<TechniqueDTO>> getTechniquesById(List<String> techniqueIds) async {
    final List<TechniqueDTO> res = [];
    final techniqueIdsList = techniqueIds.toList();

    for (var i = 0; i < techniqueIds.length; i++) {
      final document = await _techniques.doc(techniqueIdsList[i]).get();
      if (document.exists) res.add(await TechniqueDTO.fromFirestore(document));
    }

    return res;
  }
}
