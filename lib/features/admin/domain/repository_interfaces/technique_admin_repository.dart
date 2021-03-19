import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique_localized_data.dart';
import 'package:optional/optional.dart';

abstract class ITechniqueAdminRepository {
  Future<Technique> createTechnique({
    required Optional<String> productId,
    required String categoryId,
    required TechniqueDifficulty difficulty,
    required Iterable<TechniqueLocalizedData> localizedData,
    required Optional<Media> thumbnail,
    required Optional<Media> video,
  });

  Future<Technique> updateTechnique(
    String id, {
    Optional<String>? productId,
    String? categoryId,
    TechniqueDifficulty? difficulty,
    Iterable<TechniqueLocalizedData>? localizedData,
    Optional<Media>? thumbnail,
    Optional<Media>? video,
  });

  Future<Iterable<Technique>> getAllTechniques();

  Future<Iterable<Technique>> getTechniquesByCategory(Category category);
}
