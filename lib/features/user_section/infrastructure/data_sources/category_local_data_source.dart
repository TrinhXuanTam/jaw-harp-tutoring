import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/NotFoundError.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/category_DTO.dart';

/// Local data source for caching categories.
@LazySingleton(env: [Environment.prod])
class CategoryLocalDataSource {
  /// Cache all categories if loaded all at once
  List<CategoryDTO>? _cachedAllCategories;

  void cacheAllCategories(Iterable<CategoryDTO> categories) => _cachedAllCategories = categories.toList();

  /// Get all cached categories.
  Iterable<CategoryDTO> getCachedAllCategories() {
    if (_cachedAllCategories == null) throw NotFoundError("All categories were not cached!");

    return _cachedAllCategories!;
  }
}
