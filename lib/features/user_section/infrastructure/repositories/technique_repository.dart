import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/NotFoundError.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart';
import 'package:jews_harp/features/user_section/infrastructure/data_sources/technique_local_data_source.dart';

@LazySingleton(as: ITechniqueRepository, env: [Environment.prod])
class TechniqueRepository extends ITechniqueRepository {
  final FirebaseUserSectionDataSource _firebaseUserSectionDataSource;
  final TechniqueLocalDataSource _techniqueLocalDataSource;

  TechniqueRepository(this._firebaseUserSectionDataSource, this._techniqueLocalDataSource);

  @override
  Future<Iterable<Technique>> getAllTechniques() async {
    try {
      return _techniqueLocalDataSource.getCachedAllTechniques();
    } on NotFoundError {
      final techniques = await _firebaseUserSectionDataSource.getAllTechniques();
      _techniqueLocalDataSource.cacheAllTechniques(techniques);
      return techniques;
    }
  }

  @override
  Future<Iterable<Technique>> getTechniquesByCategory(Category category) async {
    final List<Technique> techniques = [];

    for (final techniqueId in category.techniqueIds) {
      try {
        techniques.add(_techniqueLocalDataSource.getCachedTechnique(techniqueId));
      } on NotFoundError {
        final technique = await _firebaseUserSectionDataSource.getTechniqueById(techniqueId);
        _techniqueLocalDataSource.cacheTechnique(technique);
        techniques.add(technique);
      }
    }

    return techniques;
  }

  @override
  Future<Iterable<Technique>> getMostRecentTechniques() async {
    try {
      return _techniqueLocalDataSource.getCachedMostRecentTechniques();
    } on NotFoundError {
      final techniques = await _firebaseUserSectionDataSource.getMostRecentTechniques();
      _techniqueLocalDataSource.cacheMostRecentTechniques(techniques);
      return techniques;
    }
  }
}
