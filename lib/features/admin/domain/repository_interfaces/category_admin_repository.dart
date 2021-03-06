import 'package:jews_harp/features/techniques/domain/entities/category.dart';
import 'package:jews_harp/features/techniques/domain/entities/category_localized_data.dart';

abstract class ICategoryAdminRepository {
  Future<Category> createCategory(bool isVisible, Iterable<CategoryLocalizedData> localizedData);

  Future<Iterable<Category>> getVisibleCategories();

  Future<Iterable<Category>> getHiddenCategories();
}
