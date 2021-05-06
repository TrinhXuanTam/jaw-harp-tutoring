import 'package:jews_harp/features/user_section/domain/entities/category.dart';

/// Category repository.
abstract class ICategoryRepository {
  /// Get all visible categories.
  Future<Iterable<Category>> getAllCategories();
}
