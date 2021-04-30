import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/domain/category_localized_data.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';
import 'package:jews_harp/features/admin/infrastructure/DTO/category_localized_data_DTO.dart';
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/mediaDTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart';
import 'package:optional/optional.dart';

/// Category admin repository.
@LazySingleton(as: ICategoryAdminRepository, env: [Environment.prod])
class CategoryAdminRepository extends ICategoryAdminRepository {
  final FirebaseAdminDataSource _adminDataSource;
  final FirebaseUserSectionDataSource _userSectionDataSource;

  CategoryAdminRepository(this._adminDataSource, this._userSectionDataSource);

  /// Create a new category and save it to Firestore database.
  @override
  Future<Category> createCategory({
    required bool isVisible,
    required Optional<Media> thumbnail,
    required Iterable<CategoryLocalizedData> localizedData,
  }) {
    return _adminDataSource.createCategory(
      isVisible,
      thumbnail.map((t) => MediaDTO.fromEntity(t)),
      localizedData.map((e) => CategoryLocalizedDataDTO.fromEntity(e)),
    );
  }

  /// Update a category of given [id].
  @override
  Future<Category> updateCategory({
    required String id,
    bool? isVisible,
    Optional<Media>? thumbnail,
    Iterable<CategoryLocalizedData>? localizedData,
  }) {
    return _adminDataSource.updateCategory(
      id,
      isVisible: isVisible,
      thumbnail: thumbnail?.map((t) => MediaDTO.fromEntity(t)),
      localizedData: localizedData?.map((e) => CategoryLocalizedDataDTO.fromEntity(e)),
    );
  }

  /// Get categories marked as hidden.
  @override
  Future<Iterable<Category>> getHiddenCategories() => _adminDataSource.getHiddenCategories();

  /// Get all visible and hidden categories.
  @override
  Future<Iterable<Category>> getAllCategories() => _adminDataSource.getAllCategories();

  /// Get categories marked as visible.
  @override
  Future<Iterable<Category>> getVisibleCategories() => _userSectionDataSource.getAllCategories();

  /// Get localized category data of given [id].
  @override
  Future<Map<String, CategoryLocalizedData>> getLocalizedData(String categoryId) => _adminDataSource.getCategoryLocalizedData(categoryId);
}
