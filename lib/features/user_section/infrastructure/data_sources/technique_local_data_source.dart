import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/NotFoundError.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/mediaDTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/technique_DTO.dart';
import 'package:optional/optional.dart';
import 'package:path_provider/path_provider.dart';

/// Local data source for caching techniques.
@LazySingleton(env: [Environment.prod])
class TechniqueLocalDataSource {
  final Map<String, TechniqueDTO> _cachedTechniques = {};
  List<TechniqueDTO>? _cachedMostRecentTechniques;
  List<TechniqueDTO>? _cachedAllTechniques;

  /// Cache a single technique.
  void cacheTechnique(TechniqueDTO technique) {
    _cachedTechniques[technique.id] = technique;
  }

  /// Get directory where downloaded techniques are saved.
  Future<String> get techniquePath async {
    final applicationDirectory = await getApplicationDocumentsDirectory();
    return "${applicationDirectory.path}/techniques";
  }

  /// Cache most recent technique list.
  void cacheMostRecentTechniques(Iterable<TechniqueDTO> techniques) {
    _cachedMostRecentTechniques = techniques.toList();

    // Save to single techniques as well.
    for (final technique in techniques) {
      if (!_cachedTechniques.containsKey(technique.id)) {
        _cachedTechniques[technique.id] = technique;
      }
    }
  }

  /// Cache all techniques list.
  void cacheAllTechniques(Iterable<TechniqueDTO> techniques) {
    _cachedAllTechniques = techniques.toList();

    // Save to single techniques as well.
    for (final technique in techniques) {
      if (!_cachedTechniques.containsKey(technique.id)) {
        _cachedTechniques[technique.id] = technique;
      }
    }
  }

  /// Get a single cached techniques.
  TechniqueDTO getCachedTechnique(String techniqueId) {
    if (!_cachedTechniques.containsKey(techniqueId)) throw NotFoundError("Technique with given ID was not cached!");

    return _cachedTechniques[techniqueId]!;
  }

  /// Get most recent cached techniques.
  Iterable<TechniqueDTO> getCachedMostRecentTechniques() {
    if (_cachedMostRecentTechniques == null) throw NotFoundError("Most recent techniques not cached!");

    return _cachedMostRecentTechniques!;
  }

  /// Get all cached techniques.
  Iterable<TechniqueDTO> getCachedAllTechniques() {
    if (_cachedAllTechniques == null) throw NotFoundError("All techniques were not cached!");

    return _cachedAllTechniques!;
  }

  /// Save a technique to local storage.
  Future<TechniqueDTO> downloadTechnique(TechniqueDTO technique) async {
    final dio = Dio();
    final savePath = "${await techniquePath}/${technique.id}";
    String? thumbnailPath;
    String? videoPath;

    // Download the thumbnail if it exists.
    if (technique.thumbnail.isPresent && technique.thumbnail.value.url.isPresent) {
      thumbnailPath = "$savePath/thumbnail";
      await dio.download(technique.thumbnail.value.url.value, thumbnailPath);
    }

    // Download the video if it exists.
    if (technique.video.isPresent && technique.video.value.url.isPresent) {
      videoPath = "$savePath/video.mp4";
      await dio.download(technique.video.value.url.value, videoPath);
    }

    // Replace url with file path in media entity.
    final savedTechnique = technique.copyWith(
      thumbnail: thumbnailPath != null ? Optional.of(MediaDTO(filePath: thumbnailPath.toOptional)) : Optional.empty(),
      video: videoPath != null ? Optional.of(MediaDTO(filePath: videoPath.toOptional)) : Optional.empty(),
    );

    // Create file if it doesn't exist.
    var savedFile = File("$savePath/data");
    if (!(await savedFile.exists())) {
      savedFile = await savedFile.create(recursive: true);
    }

    // Save to file.
    await savedFile.writeAsString(jsonEncode(savedTechnique.toJson()));

    return savedTechnique;
  }

  /// Delete a downloaded technique.
  Future<void> deleteDownloadedTechnique(String techniqueId) async {
    final savedPath = "${await techniquePath}/$techniqueId";
    final techniqueDirectory = Directory(savedPath);

    // Delete the file if it exists.
    if (await techniqueDirectory.exists()) {
      techniqueDirectory.delete(recursive: true);
    }
  }

  /// Get all downloaded techniques.
  Future<List<TechniqueDTO>> getDownloadedTechniques() async {
    final techniquesDirectory = Directory(await techniquePath);
    final List<TechniqueDTO> techniques = [];

    if (await techniquesDirectory.exists()) {
      for (final directory in techniquesDirectory.listSync(followLinks: false)) {
        // Get raw json data.
        final rawData = File("${directory.path}/data");
        if (await rawData.exists()) {
          // Convert raw data to technique entity.
          final jsonData = jsonDecode(await rawData.readAsString());
          techniques.add(TechniqueDTO.fromJson(jsonData));
        }
      }
    }

    return techniques;
  }
}
