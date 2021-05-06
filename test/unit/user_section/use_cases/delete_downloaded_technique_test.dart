import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/user_section/application/delete_downloaded_technique.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: ITechniqueRepository, env: [DELETE_DOWNLOADED_TECHNIQUE_TEST_ENV])
class TechniqueRepositoryMock extends Mock implements ITechniqueRepository {}

void main() {
  testConfigureDependencies(DELETE_DOWNLOADED_TECHNIQUE_TEST_ENV);

  // Reset mock objects before each test.
  setUp(() {
    final techniqueRepositoryMock = serviceLocator<ITechniqueRepository>();
    reset(techniqueRepositoryMock);
  });

  final techniqueId = "id";

  test("[DeleteDownloadedTechnique] should delete technique when invoked", () async {
    var techniqueDeleted = false;
    final deleteDownloadedTechnique = serviceLocator<DeleteDownloadedTechnique>();
    final techniqueRepositoryMock = serviceLocator<ITechniqueRepository>();
    when(() => techniqueRepositoryMock.deleteDownloadedTechnique(techniqueId)).thenAnswer((_) async => techniqueDeleted = true);

    await deleteDownloadedTechnique(techniqueId);

    expect(techniqueDeleted, true);
  });
}
