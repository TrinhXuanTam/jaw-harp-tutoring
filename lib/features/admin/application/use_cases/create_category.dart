import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/category_localized_data.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class CreateCategory {
  final ICategoryAdminRepository _adminRepository;

  CreateCategory(this._adminRepository);

  Future<Category> call(bool isVisible, Iterable<CategoryLocalizedData> localizedData) => _adminRepository.createCategory(isVisible, localizedData);
}
