import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';

/// Download technique.
@LazySingleton(env: [Environment.prod, Environment.dev])
class DownloadTechnique {
  final ITechniqueRepository _techniqueRepository;

  DownloadTechnique(this._techniqueRepository);

  Future<Technique> call(String techniqueId) => _techniqueRepository.downloadTechnique(techniqueId);
}
