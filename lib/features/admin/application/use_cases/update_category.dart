import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';
import 'package:jews_harp/features/techniques/domain/entities/category.dart';
import 'package:jews_harp/features/techniques/domain/entities/category_localized_data.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class UpdateCategory {
  final ICategoryAdminRepository _adminRepository;

  UpdateCategory(this._adminRepository);

  Future<Category> call(
    String id, {
    bool? isVisible,
    Iterable<CategoryLocalizedData>? localizedData,
  }) {
    return _adminRepository.updateCategory(id, isVisible: isVisible, localizedData: localizedData);
  }
}
