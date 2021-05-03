import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';

/// Get a single technique by id.
@LazySingleton(env: [Environment.prod, Environment.dev])
class GetTechniqueById {
  final ITechniqueRepository _techniqueRepository;

  GetTechniqueById(this._techniqueRepository);

  Future<Technique> call(String id) => _techniqueRepository.getTechniqueById(id);
}
