import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: IUserAuthFacade, env: [SIGN_OUT_TEST_ENV])
class UserAuthFacade extends Mock implements IUserAuthFacade {}

void main() {
  testConfigureDependencies(SIGN_OUT_TEST_ENV);

  setUp(() {
    final userAuthFacade = serviceLocator<IUserAuthFacade>();
    reset(userAuthFacade);
  });

  test("[SignOut] should sign out user when user is signed in.", () async {
    var signedIn = true;
    final signOut = serviceLocator<SignOut>();
    final userAuthFacade = serviceLocator<IUserAuthFacade>();
    when(() => userAuthFacade.signOut()).thenAnswer((_) async => signedIn = false);

    await signOut();

    expect(signedIn, false);
  });
}
