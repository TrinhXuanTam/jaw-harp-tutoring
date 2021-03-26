import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class GetDownloadedTechniques {
  final ITechniqueRepository _techniqueRepository;

  GetDownloadedTechniques(this._techniqueRepository);

  Future<List<Technique>> call() => _techniqueRepository.getDownloadedTechniques();
}
