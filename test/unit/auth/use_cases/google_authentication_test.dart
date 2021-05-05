import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: IUserAuthFacade, env: [GOOGLE_AUTHENTICATION_TEST_ENV])
class UserAuthFacadeMock extends Mock implements IUserAuthFacade {}

void main() {
  testConfigureDependencies(GOOGLE_AUTHENTICATION_TEST_ENV);

  final uid = "0";
  final name = "John Doe";
  final email = "john.doe@gmail.com";
  final isVerified = true;

  final user = UserDTO(
    uid: uid,
    name: name,
    email: email,
    isVerified: isVerified,
  );

  // Reset mock objects before each test.
  setUp(() {
    final userAuthFacade = serviceLocator<IUserAuthFacade>();
    reset(userAuthFacade);
  });

  test("[GoogleAuthentication] should return user data when user signs into google", () async {
    final googleAuthentication = serviceLocator<GoogleAuthentication>();
    final userAuthFacade = serviceLocator<IUserAuthFacade>();
    when(() => userAuthFacade.signInWithGoogle()).thenAnswer((_) async => user);

    final res = await googleAuthentication();

    expect(res, user);
  });
}
