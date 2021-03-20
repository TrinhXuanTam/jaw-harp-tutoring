import 'package:jews_harp/features/user_section/domain/entities/technique.dart';

abstract class ITechniqueRepository {
  Future<Iterable<Technique>> getAllTechniques();
}
