import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart';

@LazySingleton(as: ITechniqueRepository, env: [Environment.prod])
class TechniqueRepository extends ITechniqueRepository {
  final FirebaseUserSectionDataSource _firebaseUserSectionDataSource;

  TechniqueRepository(this._firebaseUserSectionDataSource);

  @override
  Future<Iterable<Technique>> getAllTechniques() => _firebaseUserSectionDataSource.getAllTechniques();


  @override
  Future<Iterable<Technique>> getTechniquesByCategory(Category category) => _firebaseUserSectionDataSource.getTechniquesById(category.techniqueIds);
}
