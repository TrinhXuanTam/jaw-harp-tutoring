import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';

/// Get all techniques.
@LazySingleton(env: [Environment.prod, Environment.dev])
class GetAllTechniques {
  final ITechniqueAdminRepository _techniqueAdminRepository;

  GetAllTechniques(this._techniqueAdminRepository);

  Future<Iterable<Technique>> call() => _techniqueAdminRepository.getAllTechniques();
}
