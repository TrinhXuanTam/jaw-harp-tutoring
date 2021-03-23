import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class GetTechniquesByCategory {
  final Map<String, Iterable<Technique>> _categoryCachedTechniques = {};
  final ITechniqueRepository _techniqueRepository;

  GetTechniquesByCategory(this._techniqueRepository);

  Future<Iterable<Technique>> call(Category category) async {
    if (_categoryCachedTechniques.containsKey(category.id)) return _categoryCachedTechniques[category.id]!;

    final techniques = await _techniqueRepository.getTechniquesByCategory(category);
    _categoryCachedTechniques[category.id] = techniques;
    return techniques;
  }
}
