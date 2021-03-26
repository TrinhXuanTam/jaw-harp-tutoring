import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/NotFoundError.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/category_DTO.dart';

@LazySingleton(env: [Environment.prod])
class CategoryLocalDataSource {
  List<CategoryDTO>? _cachedAllCategories;

  void cacheAllCategories(Iterable<CategoryDTO> categories) => _cachedAllCategories = categories.toList();

  Iterable<CategoryDTO> getCachedAllCategories() {
    if (_cachedAllCategories == null) throw NotFoundError("All categories were not cached!");

    return _cachedAllCategories!;
  }
}
