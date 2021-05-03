import 'package:jews_harp/features/user_section/domain/entities/technique.dart';

/// User section related logic.
abstract class IUserSectionFacade {
  /// Save technique to favorites.
  Future<void> markTechniqueAsFavorite(String techniqueId);

  /// Remove technique from favorites.
  Future<void> removeTechniqueFromFavorites(String techniqueId);

  /// Purchase a technique.
  Future<void> purchaseTechnique(Technique technique);
}
