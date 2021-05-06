import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';

/// Get categories marked as visible.
@LazySingleton(env: [Environment.prod, Environment.dev, GET_TECHNIQUES_BY_CATEGORY_TEST_ENV])
class GetTechniquesByCategory {
  final ITechniqueAdminRepository _techniqueAdminRepository;

  GetTechniquesByCategory(this._techniqueAdminRepository);

  Future<Iterable<Technique>> call(Category category) => _techniqueAdminRepository.getTechniquesByCategory(category);
}
