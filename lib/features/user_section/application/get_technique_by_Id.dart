import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';

/// Get a single technique by id.
@LazySingleton(env: [Environment.prod, Environment.dev, GET_TECHNIQUE_BY_ID_TEST_ENV])
class GetTechniqueById {
  final ITechniqueRepository _techniqueRepository;

  GetTechniqueById(this._techniqueRepository);

  Future<Technique> call(String id) => _techniqueRepository.getTechniqueById(id);
}
