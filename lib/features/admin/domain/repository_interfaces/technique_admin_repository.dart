import 'package:jews_harp/features/admin/domain/domain/technique_localized_data.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:optional/optional.dart';

/// Technique repository admin interface.
abstract class ITechniqueAdminRepository {
  Future<Technique> createTechnique({
    required Optional<String> productId,
    required String categoryId,
    required TechniqueDifficulty difficulty,
    required Iterable<TechniqueLocalizedData> localizedData,
    required Optional<Media> thumbnail,
    required Optional<Media> video,
  });

  Future<Technique> updateTechnique({
    required String id,
    Optional<String>? productId,
    String? categoryId,
    TechniqueDifficulty? difficulty,
    Iterable<TechniqueLocalizedData>? localizedData,
    Optional<Media>? thumbnail,
    Optional<Media>? video,
  });

  Future<Iterable<Technique>> getAllTechniques();

  Future<Map<String, TechniqueLocalizedData>> getLocalizedData(String techniqueId);
}
