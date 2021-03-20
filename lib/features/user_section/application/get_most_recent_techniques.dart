import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class GetMostRecentTechniques {
  // TODO
  Future<Iterable<Technique>> call() => throw UnimplementedError();
}
