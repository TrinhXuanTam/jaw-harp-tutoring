import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: IUserAuthFacade, env: [SEND_EMAIL_VERIFICATION_TEST_ENV])
class UserAuthFacade extends Mock implements IUserAuthFacade {}

void main() {
  testConfigureDependencies(SEND_EMAIL_VERIFICATION_TEST_ENV);

  // Reset mock objects before each test.
  setUp(() {
    final userAuthFacade = serviceLocator<IUserAuthFacade>();
    reset(userAuthFacade);
  });

  test("[SendEmailVerification] should send verification link when email is valid", () async {
    var linkSent = false;
    final sendEmailVerification = serviceLocator<SendEmailVerification>();
    final userAuthFacade = serviceLocator<IUserAuthFacade>();
    when(() => userAuthFacade.sendVerificationEmail()).thenAnswer((_) async => linkSent = true);

    await sendEmailVerification();

    expect(linkSent, true);
  });
}
