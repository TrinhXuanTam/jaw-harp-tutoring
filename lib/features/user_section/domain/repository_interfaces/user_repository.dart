abstract class IUserRepository {
  Future<void> markTechniqueAsFavorite(String techniqueId);

  Future<void> removeTechniqueFromFavorites(String techniqueId);
}
