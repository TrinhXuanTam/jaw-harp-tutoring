import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/category_repository.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class GetCategories {
  Iterable<Category>? _cachedCategories;
  final ICategoryRepository _categoryRepository;

  GetCategories(this._categoryRepository);

  Future<Iterable<Category>> call() async {
    if (_cachedCategories != null) return _cachedCategories!;

    final categories = await _categoryRepository.getAllCategories();
    _cachedCategories = categories;

    return categories;
  }
}
