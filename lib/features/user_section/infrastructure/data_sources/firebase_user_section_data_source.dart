import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/category_DTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/technique_DTO.dart';

/// Firebase technique data source.
@LazySingleton(env: [Environment.prod])
class FirebaseUserSectionDataSource {
  /// Firestore technique collection.
  final CollectionReference _techniques = FirebaseFirestore.instance.collection('techniques');

  /// Firestore category collection.
  final CollectionReference _categories = FirebaseFirestore.instance.collection('categories');

  /// Firestore user collection.
  final CollectionReference _users = FirebaseFirestore.instance.collection('users');

  /// Firebase Authentication service connection.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Get all published techniques.
  Future<Iterable<TechniqueDTO>> getAllTechniques() async {
    final publishedTechniques = await _techniques.where("datePublished", isNotEqualTo: null).orderBy("datePublished", descending: true).get();
    final List<TechniqueDTO> res = [];
    for (final doc in publishedTechniques.docs) res.add(await TechniqueDTO.fromFirestore(doc));
    return res;
  }

  /// Get 10 newest techniques.
  Future<Iterable<TechniqueDTO>> getMostRecentTechniques() async {
    final query = await _techniques.where("datePublished", isNotEqualTo: null).orderBy("datePublished", descending: true).limit(10).get();
    final List<TechniqueDTO> res = [];
    for (final document in query.docs) res.add(await TechniqueDTO.fromFirestore(document));
    return res;
  }

  /// Get a technique by given [techniqueId].
  Future<TechniqueDTO> getTechniqueById(String techniqueId) async {
    return TechniqueDTO.fromFirestore(await _techniques.doc(techniqueId).get());
  }

  /// Get all categories.
  Future<Iterable<CategoryDTO>> getAllCategories() async {
    final snapshot = await _categories.where("isVisible", isEqualTo: true).get();
    final List<CategoryDTO> res = [];
    for (final document in snapshot.docs) res.add(await CategoryDTO.fromFirestore(document));
    return res;
  }

  /// Mark technique as favorite.
  Future<void> markTechniqueAsFavorite(String techniqueId) {
    final uid = _auth.currentUser!.uid;
    return _users.doc(uid).update({
      "favoriteTechniques": FieldValue.arrayUnion([techniqueId]),
    });
  }

  /// Remove technique from favorites.
  Future<void> removeTechniqueFromFavorites(String techniqueId) {
    final uid = _auth.currentUser!.uid;
    return _users.doc(uid).update({
      "favoriteTechniques": FieldValue.arrayRemove([techniqueId]),
    });
  }

  /// Add purchased technique to user.
  Future<void> addPurchasedTechnique(String techniqueId) async {
    final uid = _auth.currentUser!.uid;
    _users.doc(uid).update({
      "purchasedTechniques": FieldValue.arrayUnion([techniqueId])
    });
  }
}
