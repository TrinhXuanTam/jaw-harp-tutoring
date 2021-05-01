import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/domain/technique_localized_data.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart';
import 'package:jews_harp/features/admin/infrastructure/DTO/technique_localized_data_DTO.dart';
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/mediaDTO.dart';
import 'package:optional/optional.dart';

/// Technique admin repository.
@LazySingleton(as: ITechniqueAdminRepository, env: [Environment.prod])
class TechniqueAdminRepository extends ITechniqueAdminRepository {
  final FirebaseAdminDataSource _adminDataSource;

  TechniqueAdminRepository(this._adminDataSource);

  /// Create a new technique and save it to Firestore database.
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
      localizedData: localizedData.map((e) => TechniqueLocalizedDataDTO.fromEntity(e)),
      thumbnail: thumbnail.map((t) => MediaDTO.fromEntity(t)),
      video: video.map((v) => MediaDTO.fromEntity(v)),
    );
  }

  /// Update a technique of given [id].
  @override
  Future<Technique> updateTechnique({
    required String id,
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
      localizedData: localizedData?.map((e) => TechniqueLocalizedDataDTO.fromEntity(e)),
      thumbnail: thumbnail?.map((t) => MediaDTO.fromEntity(t)),
      video: video?.map((v) => MediaDTO.fromEntity(v)),
    );
  }

  /// Get all techniques.
  @override
  Future<Iterable<Technique>> getAllTechniques() => _adminDataSource.getAllTechniques();

  /// Get localized technique data of given [id].
  @override
  Future<Map<String, TechniqueLocalizedData>> getLocalizedData(String techniqueId) => _adminDataSource.getTechniqueLocalizedData(techniqueId);
}
