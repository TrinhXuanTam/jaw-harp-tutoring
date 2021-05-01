import 'package:jews_harp/features/admin/domain/domain/technique_localized_data.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:optional/optional.dart';

/// Technique repository admin interface.
abstract class ITechniqueAdminRepository {
  /// Create a new technique with given parameters.
  Future<Technique> createTechnique({
    required Optional<String> productId,
    required String categoryId,
    required TechniqueDifficulty difficulty,
    required Iterable<TechniqueLocalizedData> localizedData,
    required Optional<Media> thumbnail,
    required Optional<Media> video,
  });

  /// Update the technique with the specified parameters.
  /// All parameters are optional except the [id] of the category.
  Future<Technique> updateTechnique({
    required String id,
    Optional<String>? productId,
    String? categoryId,
    TechniqueDifficulty? difficulty,
    Iterable<TechniqueLocalizedData>? localizedData,
    Optional<Media>? thumbnail,
    Optional<Media>? video,
  });

  /// Get all techniques.
  Future<Iterable<Technique>> getAllTechniques();

  /// Get localized data of a category with the specified [techniqueId].
  Future<Map<String, TechniqueLocalizedData>> getLocalizedData(String techniqueId);
}
