import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/domain/technique_localized_data.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:optional/optional.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class UpdateTechnique {
  final ITechniqueAdminRepository _techniqueAdminRepository;

  UpdateTechnique(this._techniqueAdminRepository);

  Future<Technique> call(
    String id, {
    Optional<String>? productId,
    String? categoryId,
    TechniqueDifficulty? difficulty,
    Iterable<TechniqueLocalizedData>? localizedData,
    Optional<Media>? thumbnail,
    Optional<Media>? video,
  }) {
    return _techniqueAdminRepository.updateTechnique(
      id,
      productId: productId,
      categoryId: categoryId,
      difficulty: difficulty,
      localizedData: localizedData,
      thumbnail: thumbnail,
      video: video,
    );
  }
}
