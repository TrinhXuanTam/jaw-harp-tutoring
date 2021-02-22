import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/core/constants.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:jews_harp/features/auth/domain/use_cases/email_authentication.dart';
import 'package:mockito/mockito.dart';
import 'package:optional/optional.dart';

import '../../../../dependency_injection/mock.dart';
import '../../../../dependency_injection/test_service_locator.dart';

void main() {
  testConfigureDependencies(EMAIL_AUTHENTICATION_TEST_ENV);

  test("[EmailAuthentication] should return user data when correct credentials are given", () async {
    final uid = "0";
    final name = "John Doe";
    final email = "john.doe@gmail.com";
    final password = "John123456";

    when(testServiceLocator<IUserRepository>().getUserWithEmailAndPassword(email, password)).thenAnswer(
      (_) async => Optional.of(UserMock(uid, name, email, password)),
    );

    final emailAuthentication = testServiceLocator<EmailAuthentication>();
    final user = await emailAuthentication(email, password);

    assert(user.isPresent);

    final userData = user.value;

    assert(userData.email == email);
    assert(userData.name == name);
    assert(userData.uid == uid);
  });

  test("[EmailAuthentication] should return 'Optional.empty()' when invalid credentials are given", () async {
    final email = "john.doe@gmail.com";
    final password = "John123456";

    when(testServiceLocator<IUserRepository>().getUserWithEmailAndPassword(email, password)).thenAnswer(
      (_) async => Optional.empty(),
    );

    final emailAuthentication = testServiceLocator<EmailAuthentication>();
    final user = await emailAuthentication(email, password);

    assert(user.isEmpty);
  });
}
