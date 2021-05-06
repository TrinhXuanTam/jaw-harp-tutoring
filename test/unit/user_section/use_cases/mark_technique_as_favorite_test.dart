import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/user_section/application/mark_technique_as_favorite.dart';
import 'package:jews_harp/features/user_section/domain/facade_interfaces/user_section_facade.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: IUserSectionFacade, env: [MARK_TECHNIQUE_AS_FAVORITE_TEST_ENV])
class UserSectionFacadeMock extends Mock implements IUserSectionFacade {}

void main() {
  testConfigureDependencies(MARK_TECHNIQUE_AS_FAVORITE_TEST_ENV);

  final techniqueId = "id";

  // Reset mock objects before each test.
  setUp(() {
    final userSectionFacadeMock = serviceLocator<IUserSectionFacade>();
    reset(userSectionFacadeMock);
  });

  test("[MarkTechniqueAsFavorite] should mark technique as favorite when invoked.", () async {
    var techniqueIsFavorite = false;
    final markTechniqueAsFavorite = serviceLocator<MarkTechniqueAsFavorite>();
    final userSectionFacadeMock = serviceLocator<IUserSectionFacade>();
    when(() => userSectionFacadeMock.markTechniqueAsFavorite(techniqueId)).thenAnswer((_) async => techniqueIsFavorite = true);

    await markTechniqueAsFavorite(techniqueId);

    expect(techniqueIsFavorite, true);
  });
}
