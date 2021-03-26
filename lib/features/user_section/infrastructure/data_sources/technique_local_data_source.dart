
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/NotFoundError.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/mediaDTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/technique_DTO.dart';
import 'package:optional/optional.dart';
import 'package:path_provider/path_provider.dart';

@LazySingleton(env: [Environment.prod])
class TechniqueLocalDataSource {
  final Map<String, TechniqueDTO> _cachedTechniques = {};
  final techniquePath = "${getApplicationDocumentsDirectory()}/techniques";
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

  Future<Technique> downloadTechnique(TechniqueDTO technique) async {
    final dio = Dio();
    final savePath = "$techniquePath/${technique.id}";
    String? thumbnailPath;
    String? videoPath;

    if (technique.thumbnail.isPresent && technique.thumbnail.value.url.isPresent) {
      thumbnailPath = "$savePath/thumbnail";
      dio.download(technique.thumbnail.value.url.value, thumbnailPath);
    }

    if (technique.video.isPresent && technique.video.value.url.isPresent) {
      videoPath = "$savePath/video";
      await dio.download(technique.video.value.url.value, videoPath);
    }

    final savedTechnique = technique.copyWith(
      thumbnail: thumbnailPath != null ? Optional.of(MediaDTO(filePath: thumbnailPath.toOptional)) : Optional.empty(),
      video: videoPath != null ? Optional.of(MediaDTO(filePath: videoPath.toOptional)) : Optional.empty(),
    );

    return savedTechnique;
  }
}
