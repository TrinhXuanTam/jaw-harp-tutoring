import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/errors/user_not_signed_in_error.dart';
import 'package:jews_harp/core/errors/validation_error.dart';
import 'package:jews_harp/features/auth/application/use_cases/link_email_provider.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';
import 'package:mockito/mockito.dart';

import '../../../../dependency_injection/test_service_locator.dart';

void main() {
  testConfigureDependencies(LINK_EMAIL_PROVIDER_TEST_ENV);

  final uid = "0";
  final name = "John Doe";
  final email = "john.doe@gmail.com";
  final password = "John123456";

  final linkEmailProvider = testServiceLocator<LinkEmailProvider>();

  test("[LinkEmailProvider] should user data when account was linked to email", () async {
    when(testServiceLocator<IUserFacade>().linkAccountToEmail(email, password)).thenAnswer(
      (_) async => UserDTO(uid: uid, name: name, email: email),
    );

    final user = await linkEmailProvider(email, password);

    assert(user.uid == uid);
    assert(user.name == name);
    assert(user.email == email);
  });

  test("[LinkEmailProvider] should throw [UserNotSignedInError] when user is not signed in", () async {
    when(testServiceLocator<IUserFacade>().linkAccountToEmail(email, password)).thenThrow(UserNotSignedInError());
    expect(() => linkEmailProvider(email, password), throwsA(isInstanceOf<UserNotSignedInError>()));
  });

  test("[LinkEmailProvider] should throw [ValidationError] when email or password is blank", () async {
    expect(() => linkEmailProvider("", ""), throwsA(isInstanceOf<ValidationError>()));
  });

  test("[LinkEmailProvider] should throw [ValidationError] when email has invalid format", () async {
    final email2 = "test.com";
    final email3 = "@test.com";
    final email4 = "test@.com";
    final email5 = "test.com";
    final email6 = "test@test";
    final email7 = "test@test.";
    final email8 = "";

    expect(() => linkEmailProvider(email2, password), throwsA(isInstanceOf<ValidationError>()));
    expect(() => linkEmailProvider(email3, password), throwsA(isInstanceOf<ValidationError>()));
    expect(() => linkEmailProvider(email4, password), throwsA(isInstanceOf<ValidationError>()));
    expect(() => linkEmailProvider(email5, password), throwsA(isInstanceOf<ValidationError>()));
    expect(() => linkEmailProvider(email6, password), throwsA(isInstanceOf<ValidationError>()));
    expect(() => linkEmailProvider(email7, password), throwsA(isInstanceOf<ValidationError>()));
    expect(() => linkEmailProvider(email8, password), throwsA(isInstanceOf<ValidationError>()));
  });

  test("[LinkEmailProvider] should throw [ValidationError] when password has invalid format", () async {
    final password2 = "a1";
    final password3 = "a12";
    final password4 = "a123";
    final password5 = "a1234";
    final password6 = "123456";
    final password7 = "ABCDEFG";

    expect(() => linkEmailProvider(email, password2), throwsA(isInstanceOf<ValidationError>()));
    expect(() => linkEmailProvider(email, password3), throwsA(isInstanceOf<ValidationError>()));
    expect(() => linkEmailProvider(email, password4), throwsA(isInstanceOf<ValidationError>()));
    expect(() => linkEmailProvider(email, password5), throwsA(isInstanceOf<ValidationError>()));
    expect(() => linkEmailProvider(email, password6), throwsA(isInstanceOf<ValidationError>()));
    expect(() => linkEmailProvider(email, password7), throwsA(isInstanceOf<ValidationError>()));
  });
}
