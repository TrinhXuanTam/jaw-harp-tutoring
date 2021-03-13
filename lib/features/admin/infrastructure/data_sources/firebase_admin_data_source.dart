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

  Future<TechniqueDTO> createTechnique({
    String? productId,
    required String categoryId,
    required TechniqueDifficulty difficulty,
    required Iterable<TechniqueLocalizedDataDTO> localizedData,
    File? thumbnail,
    File? video,
  }) async {
    final snapshot = await _techniques.add({
      "productId": productId,
      "category": categoryId,
      "difficulty": difficulty.index,
      "localization": localizedData.toJson(),
    });

    snapshot.update({
      "videoUrl": video == null ? null : await _uploadFile(snapshot.id, "video", video),
      "thumbnailUrl": thumbnail == null ? null : await _uploadFile(snapshot.id, "thumbnail", thumbnail),
    });

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

  Future<Iterable<TechniqueDTO>> getTechniquesById(List<String> techniqueIds) async {
    final List<TechniqueDTO> res = [];
    final techniqueIdsList = techniqueIds.toList();

    for (var i = 0; i < techniqueIds.length; i++) {
      final document = await _techniques.doc(techniqueIdsList[i]).get();
      if (document.exists) res.add(TechniqueDTO.fromFirestore(document));
    }

    return res;
  }
}
