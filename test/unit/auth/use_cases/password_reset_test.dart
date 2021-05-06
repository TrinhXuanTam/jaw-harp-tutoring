import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/errors/validation_error.dart';
import 'package:jews_harp/features/auth/application/use_cases/password_reset.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: IUserAuthFacade, env: [PASSWORD_RESET_TEST_ENV])
class UserAuthFacade extends Mock implements IUserAuthFacade {}

void main() {
  testConfigureDependencies(PASSWORD_RESET_TEST_ENV);

  final email = "john.doe@gmail.com";

  // Reset mock objects before each test.
  setUp(() {
    final userAuthFacade = serviceLocator<IUserAuthFacade>();
    reset(userAuthFacade);
  });

  test("[PasswordReset] should send reset link when email is valid", () async {
    var linkSent = false;
    final passwordReset = serviceLocator<PasswordReset>();
    final userAuthFacade = serviceLocator<IUserAuthFacade>();
    when(() => userAuthFacade.resetPassword(email)).thenAnswer((_) async => linkSent = true);

    await passwordReset(email);

    expect(linkSent, true);
  });

  test("[PasswordReset] should throw [ValidationError] when email has invalid format", () async {
    final passwordReset = serviceLocator<PasswordReset>();
    final email2 = "test.com";
    final email3 = "@test.com";
    final email4 = "test@.com";
    final email5 = "test.com";
    final email6 = "test@test";
    final email7 = "test@test.";
    final email8 = "";

    expect(() => passwordReset(email2), throwsA(isInstanceOf<ValidationError>()));
    expect(() => passwordReset(email3), throwsA(isInstanceOf<ValidationError>()));
    expect(() => passwordReset(email4), throwsA(isInstanceOf<ValidationError>()));
    expect(() => passwordReset(email5), throwsA(isInstanceOf<ValidationError>()));
    expect(() => passwordReset(email6), throwsA(isInstanceOf<ValidationError>()));
    expect(() => passwordReset(email7), throwsA(isInstanceOf<ValidationError>()));
    expect(() => passwordReset(email8), throwsA(isInstanceOf<ValidationError>()));
  });
}
