import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/errors/user_not_signed_in_error.dart';
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:mockito/mockito.dart';

import '../../../../dependency_injection/test_service_locator.dart';

void main() {
  testConfigureDependencies(SEND_EMAIL_VERIFICATION_TEST_ENV);

  final sendEmailVerification = testServiceLocator<SendEmailVerification>();

  test("[SendEmailVerification] should throw [UserNotSignedInError] when user is not signed in", () async {
    when(testServiceLocator<IUserFacade>().sendVerificationEmail(languageCode: "en")).thenThrow(UserNotSignedInError());
    expect(() => sendEmailVerification(), throwsA(isInstanceOf<UserNotSignedInError>()));
  });
}
