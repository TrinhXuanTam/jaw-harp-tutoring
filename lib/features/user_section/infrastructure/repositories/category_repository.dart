import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/NotFoundError.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/category_repository.dart';
import 'package:jews_harp/features/user_section/infrastructure/data_sources/category_local_data_source.dart';
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart';

/// Category repository that checks if categories are cached,
/// else get them from Firestore and cached them afterwards.
@LazySingleton(as: ICategoryRepository, env: [Environment.prod])
class CategoryRepository extends ICategoryRepository {
  final FirebaseUserSectionDataSource _firebaseUserSectionDataSource;
  final CategoryLocalDataSource _categoryLocalDataSource;

  CategoryRepository(this._firebaseUserSectionDataSource, this._categoryLocalDataSource);

  /// Get all categories.
  @override
  Future<Iterable<Category>> getAllCategories() async {
    try {
      return _categoryLocalDataSource.getCachedAllCategories();
    } on NotFoundError {
      final categories = await _firebaseUserSectionDataSource.getAllCategories();
      _categoryLocalDataSource.cacheAllCategories(categories);
      return categories;
    }
  }
}
