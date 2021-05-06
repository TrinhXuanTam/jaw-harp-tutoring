import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';

/// Get 10 most recent techniques.
@LazySingleton(env: [Environment.prod, Environment.dev, GET_MOST_RECENT_TECHNIQUES_TEST_ENV])
class GetMostRecentTechniques {
  final ITechniqueRepository _techniqueRepository;

  GetMostRecentTechniques(this._techniqueRepository);

  Future<Iterable<Technique>> call() => _techniqueRepository.getMostRecentTechniques();
}
