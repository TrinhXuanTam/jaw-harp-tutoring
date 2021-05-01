import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/NotFoundError.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/technique_DTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart';
import 'package:jews_harp/features/user_section/infrastructure/data_sources/technique_local_data_source.dart';

/// Technique repository that tries load data from cache first.
/// If not present, data gets loaded from Firstore and cached afterwards.
@LazySingleton(as: ITechniqueRepository, env: [Environment.prod])
class TechniqueRepository extends ITechniqueRepository {
  final FirebaseUserSectionDataSource _firebaseUserSectionDataSource;
  final TechniqueLocalDataSource _techniqueLocalDataSource;

  TechniqueRepository(this._firebaseUserSectionDataSource, this._techniqueLocalDataSource);

  /// Get all techniques.
  @override
  Future<Iterable<Technique>> getAllTechniques() async {
    try {
      return _techniqueLocalDataSource.getCachedAllTechniques();
    } on NotFoundError {
      final techniques = await _firebaseUserSectionDataSource.getAllTechniques();
      // Save to cache.
      _techniqueLocalDataSource.cacheAllTechniques(techniques);
      return techniques;
    }
  }

  /// Get a single category.
  @override
  Future<Iterable<Technique>> getTechniquesByCategory(Category category) async {
    final List<Technique> techniques = [];
    // Save to cache.
    for (final techniqueId in category.techniqueIds) techniques.add(await getTechniquesById(techniqueId));
    return techniques;
  }

  /// Get 10 most recent techniques.
  @override
  Future<Iterable<Technique>> getMostRecentTechniques() async {
    try {
      return _techniqueLocalDataSource.getCachedMostRecentTechniques();
    } on NotFoundError {
      final techniques = await _firebaseUserSectionDataSource.getMostRecentTechniques();
      // Save to cache.
      _techniqueLocalDataSource.cacheMostRecentTechniques(techniques);
      return techniques;
    }
  }

  /// Get a technique by given [id].
  @override
  Future<Technique> getTechniquesById(String id) async {
    try {
      return _techniqueLocalDataSource.getCachedTechnique(id);
    } on NotFoundError {
      final technique = await _firebaseUserSectionDataSource.getTechniqueById(id);
      _techniqueLocalDataSource.cacheTechnique(technique);
      return technique;
    }
  }

  /// Save a technique to local storage.
  @override
  Future<Technique> downloadTechnique(String techniqueId) async {
    final technique = await getTechniquesById(techniqueId);
    return _techniqueLocalDataSource.downloadTechnique(TechniqueDTO.fromEntity(technique));
  }

  /// Delete a downloaded technique from local storage.
  @override
  Future<void> deleteDownloadedTechnique(String techniqueId) => _techniqueLocalDataSource.deleteDownloadedTechnique(techniqueId);

  /// Get all downloaded techniques.
  @override
  Future<List<Technique>> getDownloadedTechniques() => _techniqueLocalDataSource.getDownloadedTechniques();
}
