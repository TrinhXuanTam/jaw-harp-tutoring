import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/errors/NotFoundError.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/technique_DTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart';
import 'package:jews_harp/features/user_section/infrastructure/data_sources/technique_local_data_source.dart';

/// Technique repository that tries load data from cache first.
/// If not present, data gets loaded from Firstore and cached afterwards.
@LazySingleton(as: ITechniqueRepository, env: [Environment.prod, TECHNIQUE_REPOSITORY_TEST_ENV])
class TechniqueRepository extends ITechniqueRepository {
  /// Firebase data source.
  final FirebaseUserSectionDataSource _firebaseUserSectionDataSource;

  /// Local storage for downloading and caching techniques.
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
  Future<Technique> getTechniqueById(String id) async {
    try {
      return _techniqueLocalDataSource.getCachedTechnique(id);
    } on NotFoundError {
      final technique = await _firebaseUserSectionDataSource.getTechniqueById(id);
      // Save to cache.
      _techniqueLocalDataSource.cacheTechnique(technique);
      return technique;
    }
  }

  /// Get a single category.
  @override
  Future<Iterable<Technique>> getTechniquesByCategory(Category category) async {
    final List<Technique> techniques = [];
    // Save to cache.
    for (final techniqueId in category.techniqueIds) techniques.add(await getTechniqueById(techniqueId));
    return techniques;
  }

  /// Save a technique to local storage.
  @override
  Future<Technique> downloadTechnique(String techniqueId) async {
    final technique = await getTechniqueById(techniqueId);
    return _techniqueLocalDataSource.downloadTechnique(TechniqueDTO.fromEntity(technique));
  }

  /// Delete a downloaded technique from local storage.
  @override
  Future<void> deleteDownloadedTechnique(String techniqueId) => _techniqueLocalDataSource.deleteDownloadedTechnique(techniqueId);

  /// Get all downloaded techniques.
  @override
  Future<List<Technique>> getDownloadedTechniques() => _techniqueLocalDataSource.getDownloadedTechniques();
}
