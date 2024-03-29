import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/category_repository.dart';

/// Get all categories.
@LazySingleton(env: [Environment.prod, Environment.dev, GET_CATEGORIES_TEST_ENV])
class GetCategories {
  final ICategoryRepository _categoryRepository;

  GetCategories(this._categoryRepository);

  Future<Iterable<Category>> call() => _categoryRepository.getAllCategories();
}
