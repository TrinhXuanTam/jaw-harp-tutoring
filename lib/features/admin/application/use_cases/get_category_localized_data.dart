import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/category_localized_data.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class GetCategoryLocalizedData {
  final ICategoryAdminRepository _adminRepository;

  GetCategoryLocalizedData(this._adminRepository);

  Future<Map<String, CategoryLocalizedData>> call(Category category) => _adminRepository.getLocalizedData(category);
}
