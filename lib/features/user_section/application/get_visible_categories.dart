import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/category_repository.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class GetVisibleCategories {
  final ICategoryRepository _categoryRepository;

  GetVisibleCategories(this._categoryRepository);

  Future<Iterable<Category>> call() => _categoryRepository.getVisibleCategories();
}
