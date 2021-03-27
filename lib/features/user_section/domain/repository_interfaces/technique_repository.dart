import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';

abstract class ITechniqueRepository {
  Future<Iterable<Technique>> getAllTechniques();

  Future<Iterable<Technique>> getMostRecentTechniques();

  Future<Iterable<Technique>> getTechniquesByCategory(Category category);

  Future<Technique> getTechniquesById(String id);

  Future<Technique> downloadTechnique(String techniqueId);

  Future<void> deleteDownloadedTechnique(String techniqueId);

  Future<List<Technique>> getDownloadedTechniques();
}
