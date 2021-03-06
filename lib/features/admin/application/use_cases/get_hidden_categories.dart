import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';
import 'package:jews_harp/features/techniques/domain/entities/category.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class GetHiddenCategories {
  final ICategoryAdminRepository _adminRepository;

  GetHiddenCategories(this._adminRepository);

  Future<Iterable<Category>> call() => _adminRepository.getHiddenCategories();
}