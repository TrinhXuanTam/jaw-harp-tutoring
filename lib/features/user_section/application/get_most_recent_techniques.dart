import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';
import 'package:jews_harp/features/user_section/utils.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class GetMostRecentTechniques {
  final ITechniqueRepository _techniqueRepository;

  GetMostRecentTechniques(this._techniqueRepository);

  Future<Iterable<Technique>> call() async {
    final allTechniques = (await _techniqueRepository.getAllTechniques()).toList();
    allTechniques.sort(techniqueDatePublishedComparator);
    return allTechniques.take(10).toList();
  }
}
