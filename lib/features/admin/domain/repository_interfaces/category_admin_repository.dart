import 'package:jews_harp/features/admin/domain/domain/category_localized_data.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:optional/optional.dart';

/// Category repository admin interface.
abstract class ICategoryAdminRepository {
  Future<Category> createCategory({
    required bool isVisible,
    required Optional<Media> thumbnail,
    required Iterable<CategoryLocalizedData> localizedData,
  });

  Future<Category> updateCategory({
    required String id,
    bool? isVisible,
    Optional<Media>? thumbnail,
    Iterable<CategoryLocalizedData>? localizedData,
  });

  Future<Iterable<Category>> getHiddenCategories();

  Future<Iterable<Category>> getVisibleCategories();

  Future<Iterable<Category>> getAllCategories();

  Future<Map<String, CategoryLocalizedData>> getLocalizedData(String categoryId);
}
