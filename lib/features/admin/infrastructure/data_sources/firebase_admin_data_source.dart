import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/category_DTO.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/category_localized_data_DTO.dart';

@LazySingleton(env: [Environment.prod])
class FirebaseAdminDataSource {
  CollectionReference _categories = FirebaseFirestore.instance.collection('categories');

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
