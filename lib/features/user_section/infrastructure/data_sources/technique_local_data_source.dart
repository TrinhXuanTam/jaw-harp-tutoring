import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/NotFoundError.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/mediaDTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/technique_DTO.dart';
import 'package:optional/optional.dart';
import 'package:path_provider/path_provider.dart';

@LazySingleton(env: [Environment.prod])
class TechniqueLocalDataSource {
  final Map<String, TechniqueDTO> _cachedTechniques = {};
  List<TechniqueDTO>? _cachedMostRecentTechniques;
  List<TechniqueDTO>? _cachedAllTechniques;

  void cacheTechnique(TechniqueDTO technique) {
    _cachedTechniques[technique.id] = technique;
  }

  Future<String> get techniquePath async {
    final applicationDirectory = await getApplicationDocumentsDirectory();
    return "${applicationDirectory.path}/techniques";
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

  Future<TechniqueDTO> downloadTechnique(TechniqueDTO technique) async {
    final dio = Dio();
    final savePath = "${await techniquePath}/${technique.id}";
    String? thumbnailPath;
    String? videoPath;

    if (technique.thumbnail.isPresent && technique.thumbnail.value.url.isPresent) {
      thumbnailPath = "$savePath/thumbnail";
      await dio.download(technique.thumbnail.value.url.value, thumbnailPath);
    }

    if (technique.video.isPresent && technique.video.value.url.isPresent) {
      videoPath = "$savePath/video";
      await dio.download(technique.video.value.url.value, videoPath);
    }

    final savedTechnique = technique.copyWith(
      thumbnail: thumbnailPath != null ? Optional.of(MediaDTO(filePath: thumbnailPath.toOptional)) : Optional.empty(),
      video: videoPath != null ? Optional.of(MediaDTO(filePath: videoPath.toOptional)) : Optional.empty(),
    );

    var savedFile = File("$savePath/data");
    if (!(await savedFile.exists())) savedFile = await savedFile.create(recursive: true);

    await savedFile.writeAsString(jsonEncode(savedTechnique.toJson()));

    return savedTechnique;
  }

  Future<List<TechniqueDTO>> getDownloadedTechniques() async {
    final techniquesDirectory = Directory(await techniquePath);
    final List<TechniqueDTO> techniques = [];

    if (await techniquesDirectory.exists()) {
      for (final directory in techniquesDirectory.listSync(followLinks: false)) {
        final rawData = File("${directory.path}/data");
        if (await rawData.exists()) {
          final jsonData = jsonDecode(await rawData.readAsString());
          techniques.add(TechniqueDTO.fromJson(jsonData));
        }
      }
    }

    return techniques;
  }
}
