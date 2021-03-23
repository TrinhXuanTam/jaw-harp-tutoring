import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class GetTechniques {
  Iterable<Technique>? _cachedTechniques;
  final ITechniqueRepository _techniqueRepository;

  GetTechniques(this._techniqueRepository);

  Future<Iterable<Technique>> call() async {
    if (_cachedTechniques != null) return _cachedTechniques!;

    _cachedTechniques = await _techniqueRepository.getAllTechniques();

    return _cachedTechniques!;
  }
}
