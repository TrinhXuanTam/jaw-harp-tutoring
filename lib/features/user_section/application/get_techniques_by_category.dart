import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';

/// Get technique by its category.
@LazySingleton(env: [Environment.prod, Environment.dev])
class GetTechniquesByCategory {
  final ITechniqueRepository _techniqueRepository;

  GetTechniquesByCategory(this._techniqueRepository);

  Future<Iterable<Technique>> call(Category category) => _techniqueRepository.getTechniquesByCategory(category);
}
