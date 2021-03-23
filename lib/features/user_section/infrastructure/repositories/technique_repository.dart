import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart';

@LazySingleton(as: ITechniqueRepository, env: [Environment.prod])
class TechniqueRepository extends ITechniqueRepository {
  Iterable<Technique>? _cachedTechniques;
  final Map<String, Iterable<Technique>> _categoryCachedData = {};
  final FirebaseUserSectionDataSource _firebaseUserSectionDataSource;

  TechniqueRepository(this._firebaseUserSectionDataSource);

  @override
  Future<Iterable<Technique>> getAllTechniques() async {
    if (_cachedTechniques != null) return _cachedTechniques!;

    _cachedTechniques = await _firebaseUserSectionDataSource.getAllTechniques();
    return _cachedTechniques!;
  }

  @override
  Future<Iterable<Technique>> getTechniquesByCategory(Category category) async {
    if (_categoryCachedData.containsKey(category.id)) {
      return _categoryCachedData[category.id]!;
    } else {
      final techniques = await _firebaseUserSectionDataSource.getTechniquesById(category.techniqueIds);
      _categoryCachedData[category.id] = techniques;
      return techniques;
    }
  }

  @override
  Future<Iterable<Technique>> getMostRecentTechniques() => _firebaseUserSectionDataSource.getMostRecentTechniques();
}
