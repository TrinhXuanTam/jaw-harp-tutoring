import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/user_repository.dart';
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart';

@LazySingleton(as: IUserRepository, env: [Environment.prod])
class UserRepository extends IUserRepository {
  final FirebaseUserSectionDataSource _firebaseUserSectionDataSource;

  UserRepository(this._firebaseUserSectionDataSource);

  @override
  Future<void> markTechniqueAsFavorite(String techniqueId) => _firebaseUserSectionDataSource.markTechniqueAsFavorite(techniqueId);

  @override
  Future<void> removeTechniqueFromFavorites(String techniqueId) => _firebaseUserSectionDataSource.removeTechniqueFromFavorites(techniqueId);
}
