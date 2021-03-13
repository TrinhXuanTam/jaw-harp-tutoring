import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';
import 'package:jews_harp/features/techniques/domain/entities/category.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class UpdateCategory {
  final ICategoryAdminRepository _adminRepository;

  UpdateCategory(this._adminRepository);

  Future<Category> call(Category category) => _adminRepository.updateCategory(category);
}
