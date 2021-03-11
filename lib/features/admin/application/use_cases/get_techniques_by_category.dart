import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';
import 'package:jews_harp/features/techniques/domain/entities/category.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class GetTechniquesByCategory {
  final ICategoryAdminRepository _adminRepository;

  GetTechniquesByCategory(this._adminRepository);

  Future<Iterable<Technique>> call(Category category) => _adminRepository.getTechniquesByCategory(category);
}
