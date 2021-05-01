import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';

/// Get all techniques.
@LazySingleton(env: [Environment.prod, Environment.dev])
class GetTechniques {
  final ITechniqueRepository _techniqueRepository;

  GetTechniques(this._techniqueRepository);

  Future<Iterable<Technique>> call() => _techniqueRepository.getAllTechniques();
}
