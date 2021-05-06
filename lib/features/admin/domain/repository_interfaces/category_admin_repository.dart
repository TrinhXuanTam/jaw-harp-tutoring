import 'package:jews_harp/features/admin/domain/domain/category_localized_data.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:optional/optional.dart';

/// Category repository admin interface.
abstract class ICategoryAdminRepository {
  /// Create a new category with given parameters.
  Future<Category> createCategory({
    required bool isVisible,
    required Optional<Media> thumbnail,
    required Iterable<CategoryLocalizedData> localizedData,
  });

  /// Update the category with the specified parameters.
  /// All parameters are optional except the [id] of the category.
  Future<Category> updateCategory({
    required String id,
    bool? isVisible,
    Optional<Media>? thumbnail,
    Iterable<CategoryLocalizedData>? localizedData,
  });

  /// Get all categories all categories.
  Future<Iterable<Category>> getAllCategories();

  /// Get all categories that have [isVisible] set to false.
  Future<Iterable<Category>> getHiddenCategories();

  /// Get all categories that have [isVisible] set to true.
  Future<Iterable<Category>> getVisibleCategories();

  /// Get localized data of a category with the specified [categoryId] .
  Future<Map<String, CategoryLocalizedData>> getLocalizedData(String categoryId);
}
