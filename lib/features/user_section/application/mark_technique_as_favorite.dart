import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/user_section/domain/facade_interfaces/user_section_facade.dart';

/// Mark technique as favorite.
@LazySingleton(env: [Environment.prod, Environment.dev, MARK_TECHNIQUE_AS_FAVORITE_TEST_ENV])
class MarkTechniqueAsFavorite {
  final IUserSectionFacade _userSectionFacade;

  MarkTechniqueAsFavorite(this._userSectionFacade);

  Future<void> call(String techniqueId) => _userSectionFacade.markTechniqueAsFavorite(techniqueId);
}
