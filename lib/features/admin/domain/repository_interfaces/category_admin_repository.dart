import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/category_localized_data.dart';

abstract class ICategoryAdminRepository {
  Future<Category> createCategory(bool isVisible, Iterable<CategoryLocalizedData> localizedData);

  Future<Category> updateCategory(
    String id, {
    bool? isVisible,
    Iterable<CategoryLocalizedData>? localizedData,
  });

  Future<Iterable<Category>> getHiddenCategories();

  Future<Iterable<Category>> getVisibleCategories();

  Future<Iterable<Category>> getAllCategories();

  Future<Map<String, CategoryLocalizedData>> getLocalizedData(Category category);
}
