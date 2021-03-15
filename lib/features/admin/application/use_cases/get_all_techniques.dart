import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class GetAllTechniques {
  final ICategoryAdminRepository _adminRepository;

  GetAllTechniques(this._adminRepository);

  Future<Iterable<Technique>> call() => _adminRepository.getAllTechniques();
}
