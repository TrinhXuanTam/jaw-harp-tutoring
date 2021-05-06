import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';

/// Delete downloaded technique.
@LazySingleton(env: [Environment.prod, Environment.dev, DELETE_DOWNLOADED_TECHNIQUE_TEST_ENV])
class DeleteDownloadedTechnique {
  final ITechniqueRepository _techniqueRepository;

  DeleteDownloadedTechnique(this._techniqueRepository);

  Future<void> call(String techniqueId) => _techniqueRepository.deleteDownloadedTechnique(techniqueId);
}
