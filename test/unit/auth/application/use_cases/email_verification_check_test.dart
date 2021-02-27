import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/auth/application/use_cases/email_verification_check.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:mockito/mockito.dart';

import '../../../../dependency_injection/test_service_locator.dart';

void main() {
  testConfigureDependencies(EMAIL_VERIFICATION_CHECK_TEST_ENV);
  final emailIsVerified = testServiceLocator<EmailIsVerified>();

  test("[EmailIsVerified] should return true when user is verified", () async {
    when(testServiceLocator<IUserFacade>().isVerified()).thenAnswer((_) async => true);
    assert(await emailIsVerified());
  });

  test("[EmailIsVerified] should return false when user is not verified", () async {
    when(testServiceLocator<IUserFacade>().isVerified()).thenAnswer((_) async => false);
    assert(!await emailIsVerified());
  });
}
