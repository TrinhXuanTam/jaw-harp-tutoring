import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';

/// Technique repository.
abstract class ITechniqueRepository {
  /// Get all visible techniques.
  Future<Iterable<Technique>> getAllTechniques();

  /// Get 10 most recent techniques.
  Future<Iterable<Technique>> getMostRecentTechniques();

  /// Get technique by ID.
  Future<Technique> getTechniqueById(String id);

  /// Get techniques by category.
  Future<Iterable<Technique>> getTechniquesByCategory(Category category);

  /// Download technique to local storage.
  Future<Technique> downloadTechnique(String techniqueId);

  /// Delete downloaded technique from local storage.
  Future<void> deleteDownloadedTechnique(String techniqueId);

  /// Retrieve all downloaded techniques.
  Future<List<Technique>> getDownloadedTechniques();
}
