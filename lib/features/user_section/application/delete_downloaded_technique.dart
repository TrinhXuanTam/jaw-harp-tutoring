import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class DeleteDownloadedTechnique {
  final ITechniqueRepository _techniqueRepository;

  DeleteDownloadedTechnique(this._techniqueRepository);

  Future<void> call(String techniqueId) => _techniqueRepository.deleteDownloadedTechnique(techniqueId);
}
