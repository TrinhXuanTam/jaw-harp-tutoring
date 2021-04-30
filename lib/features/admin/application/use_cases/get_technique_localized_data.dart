import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/domain/technique_localized_data.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class GetTechniqueLocalizedData {
  final ITechniqueAdminRepository _adminRepository;

  GetTechniqueLocalizedData(this._adminRepository);

  Future<Map<String, TechniqueLocalizedData>> call(Technique technique) => _adminRepository.getLocalizedData(technique);
}
