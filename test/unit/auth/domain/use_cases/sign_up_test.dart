import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/core/constants.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:jews_harp/features/auth/domain/use_cases/sign_up.dart';
import 'package:mockito/mockito.dart';
import 'package:optional/optional_internal.dart';

import '../../../../dependency_injection/mock.dart';
import '../../../../dependency_injection/test_service_locator.dart';

void main() {
  testConfigureDependencies(SIGN_UP_TEST_ENV);

  test("[SignUp] should return user data when account has been created", () async {
    final uid = "0";
    final name = "John Doe";
    final email = "john.doe@gmail.com";
    final password = "John123456";

    when(testServiceLocator<IUserRepository>().createUser(name, email, password)).thenAnswer(
      (_) async => Optional.of(UserMock(uid, name, email, password)),
    );

    final signUp = testServiceLocator<SignUp>();
    final user = await signUp(name, email, password);

    assert(user.isPresent);

    final userData = user.value;

    assert(userData.email == email);
    assert(userData.name == name);
    assert(userData.uid == uid);
  });

  test("[SignUp] should return 'Optional.empty()' when account is already taken", () async {
    final name = "John Doe";
    final email = "john.doe@gmail.com";
    final password = "John123456";

    when(testServiceLocator<IUserRepository>().createUser(name, email, password)).thenAnswer(
      (_) async => Optional.empty(),
    );

    final signUp = testServiceLocator<SignUp>();
    final user = await signUp(name, email, password);

    assert(user.isEmpty);
  });
}
