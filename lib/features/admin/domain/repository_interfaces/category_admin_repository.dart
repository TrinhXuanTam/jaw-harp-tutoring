import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/category_localized_data.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:optional/optional.dart';

abstract class ICategoryAdminRepository {
  Future<Category> createCategory(
    bool isVisible,
    Optional<Media> thumbnail,
    Iterable<CategoryLocalizedData> localizedData,
  );

  Future<Category> updateCategory(
    String id, {
    bool? isVisible,
    Optional<Media>? thumbnail,
    Iterable<CategoryLocalizedData>? localizedData,
  });

  Future<Iterable<Category>> getHiddenCategories();

  Future<Iterable<Category>> getVisibleCategories();

  Future<Iterable<Category>> getAllCategories();

  Future<Map<String, CategoryLocalizedData>> getLocalizedData(Category category);
}
