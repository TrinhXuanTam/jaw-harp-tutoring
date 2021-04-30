import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/facade_interfaces/user_section_facade.dart';

/// Remove technique from favorites.
@LazySingleton(env: [Environment.prod, Environment.dev])
class RemoveTechniqueFromFavorites {
  final IUserSectionFacade _userSectionFacade;

  RemoveTechniqueFromFavorites(this._userSectionFacade);

  Future<void> call(String techniqueId) => _userSectionFacade.removeTechniqueFromFavorites(techniqueId);
}
