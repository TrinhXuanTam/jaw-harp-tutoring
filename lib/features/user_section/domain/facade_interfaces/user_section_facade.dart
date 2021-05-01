import 'package:jews_harp/features/user_section/domain/entities/technique.dart';

abstract class IUserSectionFacade {
  Future<void> markTechniqueAsFavorite(String techniqueId);

  Future<void> removeTechniqueFromFavorites(String techniqueId);

  Future<void> purchaseTechnique(Technique technique);
}
