import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class GetMostRecentTechniques {
  final ITechniqueRepository _techniqueRepository;
  Iterable<Technique>? _cachedTechniques;

  GetMostRecentTechniques(this._techniqueRepository);

  Future<Iterable<Technique>> call() async {
    if (_cachedTechniques != null) return _cachedTechniques!;

    _cachedTechniques = await _techniqueRepository.getMostRecentTechniques();
    return _cachedTechniques!;
  }
}
