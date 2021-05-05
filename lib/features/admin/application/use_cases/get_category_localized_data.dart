import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/admin/domain/domain/category_localized_data.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';

/// Get localized data of a category.
@LazySingleton(env: [Environment.prod, Environment.dev, GET_CATEGORY_LOCALIZED_DATA_TEST_ENV])
class GetCategoryLocalizedData {
  final ICategoryAdminRepository _adminRepository;

  GetCategoryLocalizedData(this._adminRepository);

  Future<Map<String, CategoryLocalizedData>> call(String categoryId) => _adminRepository.getLocalizedData(categoryId);
}
