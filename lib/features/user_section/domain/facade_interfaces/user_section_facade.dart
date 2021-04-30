abstract class IUserSectionFacade {
  Future<void> markTechniqueAsFavorite(String techniqueId);

  Future<void> removeTechniqueFromFavorites(String techniqueId);
}
