import 'package:jews_harp/features/user_section/domain/entities/category.dart';

abstract class ICategoryRepository {
  Future<Iterable<Category>> getVisibleCategories();
}
