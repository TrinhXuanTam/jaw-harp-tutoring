import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/user_section/domain/facade_interfaces/user_section_facade.dart';

/// Remove technique from favorites.
@LazySingleton(env: [Environment.prod, Environment.dev, REMOVE_TECHNIQUE_FROM_FAVORITES_TEST_ENV])
class RemoveTechniqueFromFavorites {
  final IUserSectionFacade _userSectionFacade;

  RemoveTechniqueFromFavorites(this._userSectionFacade);

  Future<void> call(String techniqueId) => _userSectionFacade.removeTechniqueFromFavorites(techniqueId);
}
