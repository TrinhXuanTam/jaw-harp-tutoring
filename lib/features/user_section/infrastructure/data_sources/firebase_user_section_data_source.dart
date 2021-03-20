import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/category_DTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/technique_DTO.dart';

@LazySingleton(env: [Environment.prod])
class FirebaseUserSectionDataSource {
  CollectionReference _techniques = FirebaseFirestore.instance.collection('techniques');
  CollectionReference _categories = FirebaseFirestore.instance.collection('categories');

  Future<Iterable<CategoryDTO>> getAllCategories() async {
    final snapshot = await _categories.where("isVisible", isEqualTo: true).get();
    return snapshot.docs.map((e) => CategoryDTO.fromFirestore(e));
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

  Future<Iterable<TechniqueDTO>> getAllTechniques() async {
    final categories = await getAllCategories();
    final techniquesIds = categories.fold<List<String>>([], (previousValue, element) => previousValue..addAll(element.techniqueIds));
    return getTechniquesById(techniquesIds);
  }
}
