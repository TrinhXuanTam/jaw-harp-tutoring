import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/domain/technique_localized_data.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:optional/optional.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class CreateTechnique {
  final ITechniqueAdminRepository _techniqueAdminRepository;

  CreateTechnique(this._techniqueAdminRepository);

  Future<Technique> call({
    required Optional<String> productId,
    required String categoryId,
    required TechniqueDifficulty difficulty,
    required Iterable<TechniqueLocalizedData> localizedData,
    required Optional<Media> thumbnail,
    required Optional<Media> video,
  }) {
    return _techniqueAdminRepository.createTechnique(productId: productId, categoryId: categoryId, difficulty: difficulty, localizedData: localizedData, thumbnail: thumbnail, video: video);
  }
}
