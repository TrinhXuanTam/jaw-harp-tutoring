import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';
import 'package:jews_harp/features/techniques/domain/entities/media.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique_localized_data.dart';
import 'package:optional/optional.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class UpdateTechnique {
  final ICategoryAdminRepository _adminRepository;

  UpdateTechnique(this._adminRepository);

  Future<Technique> call(
    String id, {
    Optional<String>? productId,
    String? categoryId,
    TechniqueDifficulty? difficulty,
    Iterable<TechniqueLocalizedData>? localizedData,
    Optional<Media>? thumbnail,
    Optional<Media>? video,
  }) {
    return _adminRepository.updateTechnique(
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
