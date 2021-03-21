import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';

abstract class ITechniqueRepository {
  Future<Iterable<Technique>> getAllTechniques();

  Future<Iterable<Technique>> getTechniquesByCategory(Category category);
}
