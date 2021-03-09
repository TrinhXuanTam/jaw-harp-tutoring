import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/technique_already_exists_error.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/category_DTO.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/category_localized_data_DTO.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/technique_DTO.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/technique_localized_data_DTO.dart';

@LazySingleton(env: [Environment.prod])
class FirebaseAdminDataSource {
  CollectionReference _categories = FirebaseFirestore.instance.collection('categories');
  CollectionReference _techniques = FirebaseFirestore.instance.collection('techniques');
  Reference _media = FirebaseStorage.instance.ref("techniques");

  Future<String> _uploadFile(String techniqueId, String filename, File file) async {
    final task = await _media.child(techniqueId).child(filename).putFile(file);
    final url = await task.ref.getDownloadURL();
    return url;
  }

  Future<TechniqueDTO> createTechnique(
    String id,
    String categoryId,
    TechniqueDifficulty difficulty,
    Iterable<TechniqueLocalizedDataDTO> localizedData,
    File? thumbnail,
    File? video,
  ) async {
    final document = await _techniques.doc(id).get();

    if (document.exists) throw TechniqueAlreadyExistsError();

    final localization = {};
    localizedData.forEach(
      (element) => localization[element.languageCode] = {
        "title": element.title,
        "description": element.description,
        "accompanyingText": element.accompanyingText,
      },
    );

    await _techniques.doc(id).set({
      "categoryId": categoryId,
      "difficulty": difficulty.index,
      "videoUrl": video == null ? null : await _uploadFile(id, "video", video),
      "thumbnailUrl": thumbnail == null ? null : await _uploadFile(id, "thumbnail", thumbnail),
      "localization": localization,
    });

    return TechniqueDTO.fromFirestore(await _techniques.doc(id).get());
  }

  Future<CategoryDTO> createCategory(bool isVisible, Iterable<CategoryLocalizedDataDTO> localizedData) async {
    final localization = {};
    localizedData.forEach(
      (element) => localization[element.languageCode] = {
        "title": element.title,
        "description": element.description,
      },
    );

    final snapshot = await _categories.add({
      "isVisible": isVisible,
      "techniques": FieldValue.arrayUnion([]),
      "localization": localization,
    }).then((value) => value.get());

    return CategoryDTO.fromFirestore(snapshot);
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
}
