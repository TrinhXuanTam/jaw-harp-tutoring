import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/category_DTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/technique_DTO.dart';

@LazySingleton(env: [Environment.prod])
class FirebaseUserSectionDataSource {
  CollectionReference _techniques = FirebaseFirestore.instance.collection('techniques');
  CollectionReference _categories = FirebaseFirestore.instance.collection('categories');
  CollectionReference _users = FirebaseFirestore.instance.collection('users');

  Future<Iterable<CategoryDTO>> getAllCategories() async {
    final snapshot = await _categories.where("isVisible", isEqualTo: true).get();
    final List<CategoryDTO> res = [];
    for (final document in snapshot.docs) res.add(await CategoryDTO.fromFirestore(document));
    return res;
  }

  Future<TechniqueDTO> getTechniqueById(String techniqueId) async {
    return TechniqueDTO.fromFirestore(await _techniques.doc(techniqueId).get());
  }

  Future<Iterable<TechniqueDTO>> getAllTechniques() async {
    final publishedTechniques = await _techniques.where("datePublished", isNotEqualTo: null).orderBy("datePublished", descending: true).get();
    final List<TechniqueDTO> res = [];

    for (final doc in publishedTechniques.docs) res.add(await TechniqueDTO.fromFirestore(doc));

    return res;
  }

  Future<Iterable<TechniqueDTO>> getMostRecentTechniques() async {
    final query = await _techniques.where("datePublished", isNotEqualTo: null).orderBy("datePublished", descending: true).limit(10).get();
    final List<TechniqueDTO> res = [];
    for (final document in query.docs) res.add(await TechniqueDTO.fromFirestore(document));
    return res;
  }

  Future<void> markTechniqueAsFavorite(String techniqueId) {
    final currentUser = FirebaseAuth.instance.currentUser;
    return _users.doc(currentUser!.uid).update({
      "favoriteTechniques": FieldValue.arrayUnion([techniqueId]),
    });
  }

  Future<void> removeTechniqueFromFavorites(String techniqueId) {
    final currentUser = FirebaseAuth.instance.currentUser;
    return _users.doc(currentUser!.uid).update({
      "favoriteTechniques": FieldValue.arrayRemove([techniqueId]),
    });
  }
}
