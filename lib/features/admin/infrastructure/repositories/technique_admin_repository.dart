import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart';
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique_localized_data.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/mediaDTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/technique_localized_data_DTO.dart';
import 'package:optional/optional.dart';

@LazySingleton(as: ITechniqueAdminRepository, env: [Environment.prod])
class TechniqueAdminRepository extends ITechniqueAdminRepository {
  final FirebaseAdminDataSource _adminDataSource;

  TechniqueAdminRepository(this._adminDataSource);

  @override
  Future<Technique> createTechnique({
    required Optional<String> productId,
    required String categoryId,
    required TechniqueDifficulty difficulty,
    required Iterable<TechniqueLocalizedData> localizedData,
    required Optional<Media> thumbnail,
    required Optional<Media> video,
  }) {
    return _adminDataSource.createTechnique(
      productId: productId,
      categoryId: categoryId,
      difficulty: difficulty,
      localizedData: localizedData.toDTO(),
      thumbnail: thumbnail.map((t) => MediaDTO.fromEntity(t)),
      video: video.map((v) => MediaDTO.fromEntity(v)),
    );
  }

  @override
  Future<Technique> updateTechnique(
    String id, {
    Optional<String>? productId,
    String? categoryId,
    TechniqueDifficulty? difficulty,
    Iterable<TechniqueLocalizedData>? localizedData,
    Optional<Media>? thumbnail,
    Optional<Media>? video,
  }) {
    return _adminDataSource.updateTechnique(
      id,
      productId: productId,
      categoryId: categoryId,
      difficulty: difficulty,
      localizedData: localizedData?.toDTO(),
      thumbnail: thumbnail?.map((t) => MediaDTO.fromEntity(t)),
      video: video?.map((v) => MediaDTO.fromEntity(v)),
    );
  }

  @override
  Future<Iterable<Technique>> getAllTechniques() => _adminDataSource.getAllTechniques();

  @override
  Future<Iterable<Technique>> getTechniquesByCategory(Category category) => _adminDataSource.getTechniquesById(category.techniqueIds);
}
