import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/category_DTO.dart';

@LazySingleton(env: [Environment.prod])
class FirebaseUserSectionDataSource {
  CollectionReference _categories = FirebaseFirestore.instance.collection('categories');

  Future<Iterable<CategoryDTO>> getVisibleCategories() async {
    final snapshot = await _categories.where("isVisible", isEqualTo: true).get();
    return snapshot.docs.map((e) => CategoryDTO.fromFirestore(e));
  }
}
