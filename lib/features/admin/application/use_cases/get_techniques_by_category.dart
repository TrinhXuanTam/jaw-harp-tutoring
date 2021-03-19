import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class GetTechniquesByCategory {
  final ITechniqueAdminRepository _techniqueAdminRepository;

  GetTechniquesByCategory(this._techniqueAdminRepository);

  Future<Iterable<Technique>> call(Category category) => _techniqueAdminRepository.getTechniquesByCategory(category);
}
