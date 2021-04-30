import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/facade_interfaces/user_section_facade.dart';
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart';

/// User section facade for handling user related login.
@LazySingleton(as: IUserSectionFacade, env: [Environment.prod])
class UserSectionFacade extends IUserSectionFacade {
  final FirebaseUserSectionDataSource _firebaseUserSectionDataSource;

  UserSectionFacade(this._firebaseUserSectionDataSource);

  @override
  Future<void> markTechniqueAsFavorite(String techniqueId) => _firebaseUserSectionDataSource.markTechniqueAsFavorite(techniqueId);

  @override
  Future<void> removeTechniqueFromFavorites(String techniqueId) => _firebaseUserSectionDataSource.removeTechniqueFromFavorites(techniqueId);
}
