import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/NotFoundError.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/technique_DTO.dart';

@LazySingleton(env: [Environment.prod])
class TechniqueLocalDataSource {
  final Map<String, TechniqueDTO> _cachedTechniques = {};
  List<TechniqueDTO>? _cachedMostRecentTechniques;
  List<TechniqueDTO>? _cachedAllTechniques;

  void cacheTechnique(TechniqueDTO technique) {
    _cachedTechniques[technique.id] = technique;
  }

  void cacheMostRecentTechniques(Iterable<TechniqueDTO> techniques) {
    _cachedMostRecentTechniques = techniques.toList();

    for (final technique in techniques) {
      if (!_cachedTechniques.containsKey(technique.id)) {
        _cachedTechniques[technique.id] = technique;
      }
    }
  }

  void cacheAllTechniques(Iterable<TechniqueDTO> techniques) {
    _cachedAllTechniques = techniques.toList();

    for (final technique in techniques) {
      if (!_cachedTechniques.containsKey(technique.id)) {
        _cachedTechniques[technique.id] = technique;
      }
    }
  }

  TechniqueDTO getCachedTechnique(String techniqueId) {
    if (!_cachedTechniques.containsKey(techniqueId)) throw NotFoundError("Technique with given ID was not cached!");

    return _cachedTechniques[techniqueId]!;
  }

  Iterable<TechniqueDTO> getCachedMostRecentTechniques() {
    if (_cachedMostRecentTechniques == null) throw NotFoundError("Most recent techniques not cached!");

    return _cachedMostRecentTechniques!;
  }

  Iterable<TechniqueDTO> getCachedAllTechniques() {
    if (_cachedAllTechniques == null) throw NotFoundError("All techniques were not cached!");

    return _cachedAllTechniques!;
  }
}
