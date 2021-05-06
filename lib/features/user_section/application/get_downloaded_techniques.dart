import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';

/// Get all downloaded techniques.
@LazySingleton(env: [Environment.prod, Environment.dev, GET_DOWNLOADED_TECHNIQUES_TEST_ENV])
class GetDownloadedTechniques {
  final ITechniqueRepository _techniqueRepository;

  GetDownloadedTechniques(this._techniqueRepository);

  Future<List<Technique>> call() => _techniqueRepository.getDownloadedTechniques();
}
