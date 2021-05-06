import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';

/// Get hidden categories.
@LazySingleton(env: [Environment.prod, Environment.dev, GET_HIDDEN_CATEGORIES_TEST_ENV])
class GetHiddenCategories {
  final ICategoryAdminRepository _adminRepository;

  GetHiddenCategories(this._adminRepository);

  Future<Iterable<Category>> call() => _adminRepository.getHiddenCategories();
}
