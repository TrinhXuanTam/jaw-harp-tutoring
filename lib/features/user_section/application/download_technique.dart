import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class DownloadTechnique {
  final ITechniqueRepository _techniqueRepository;

  DownloadTechnique(this._techniqueRepository);

  Future<void> call(String techniqueId) => _techniqueRepository.downloadTechnique(techniqueId);
}
