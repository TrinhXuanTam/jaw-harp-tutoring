import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/domain/technique_localized_data.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart';

/// Get localized data of a technique.
@LazySingleton(env: [Environment.prod, Environment.dev])
class GetTechniqueLocalizedData {
  final ITechniqueAdminRepository _adminRepository;

  GetTechniqueLocalizedData(this._adminRepository);

  Future<Map<String, TechniqueLocalizedData>> call(String techniqueId) => _adminRepository.getLocalizedData(techniqueId);
}
