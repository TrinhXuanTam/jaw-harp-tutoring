import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/facade_interfaces/user_section_facade.dart';

/// Mark technique as favrite.
@LazySingleton(env: [Environment.prod, Environment.dev])
class MarkTechniqueAsFavorite {
  final IUserSectionFacade _userSectionFacade;

  MarkTechniqueAsFavorite(this._userSectionFacade);

  Future<void> call(String techniqueId) => _userSectionFacade.markTechniqueAsFavorite(techniqueId);
}
