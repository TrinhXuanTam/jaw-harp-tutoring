import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/user_section/application/remove_technique_from_favorites.dart';
import 'package:jews_harp/features/user_section/domain/facade_interfaces/user_section_facade.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: IUserSectionFacade, env: [REMOVE_TECHNIQUE_FROM_FAVORITES_TEST_ENV])
class UserSectionFacadeMock extends Mock implements IUserSectionFacade {}

void main() {
  testConfigureDependencies(REMOVE_TECHNIQUE_FROM_FAVORITES_TEST_ENV);

  final techniqueId = "id";

  // Reset mock objects before each test.
  setUp(() {
    final userSectionFacadeMock = serviceLocator<IUserSectionFacade>();
    reset(userSectionFacadeMock);
  });

  test("[RemoveTechniqueFromFavorites] should remove technique from favorites when invoked.", () async {
    var techniqueIsFavorite = true;
    final removeTechniqueFromFavorites = serviceLocator<RemoveTechniqueFromFavorites>();
    final userSectionFacadeMock = serviceLocator<IUserSectionFacade>();
    when(() => userSectionFacadeMock.removeTechniqueFromFavorites(techniqueId)).thenAnswer((_) async => techniqueIsFavorite = false);

    await removeTechniqueFromFavorites(techniqueId);

    expect(techniqueIsFavorite, false);
  });
}
