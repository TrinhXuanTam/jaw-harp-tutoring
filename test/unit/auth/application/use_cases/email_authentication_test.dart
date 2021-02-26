import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/errors/validation_error.dart';
import 'package:jews_harp/core/errors/wrong_email_or_password_error.dart';
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:mockito/mockito.dart';

import '../../../../dependency_injection/test_service_locator.dart';

void main() {
  testConfigureDependencies(EMAIL_AUTHENTICATION_TEST_ENV);

  final uid = "0";
  final name = "John Doe";
  final email = "john.doe@gmail.com";
  final password = "John123456";
  final emailAuthentication = testServiceLocator<EmailAuthentication>();

  when(testServiceLocator<IUserRepository>().getUserWithEmailAndPassword(email, password)).thenAnswer(
    (_) async => User(uid: uid, name: name, email: email),
  );

  test("[EmailAuthentication] should return user data when correct credentials are given", () async {
    final user = await emailAuthentication(email, password);

    assert(user.email == email);
    assert(user.name == name);
    assert(user.uid == uid);
  });

  test("[EmailAuthentication] should throw [WrongEmailOrPasswordError] when incorrect credentials are given", () async {
    final nonExistentEmail = "nonexistent@gmail.com";

    when(testServiceLocator<IUserRepository>().getUserWithEmailAndPassword(nonExistentEmail, password)).thenThrow(WrongEmailOrPasswordError());

    expect(() => emailAuthentication(nonExistentEmail, password), throwsA(isInstanceOf<WrongEmailOrPasswordError>()));
  });

  test("[EmailAuthentication] should throw [ValidationError] when email has invalid format", () async {
    final email2 = "test.com";
    final email3 = "@test.com";
    final email4 = "test@.com";
    final email5 = "test.com";
    final email6 = "test@test";
    final email7 = "test@test.";
    final email8 = "";

    expect(() => emailAuthentication(email2, password), throwsA(isInstanceOf<ValidationError>()));
    expect(() => emailAuthentication(email3, password), throwsA(isInstanceOf<ValidationError>()));
    expect(() => emailAuthentication(email4, password), throwsA(isInstanceOf<ValidationError>()));
    expect(() => emailAuthentication(email5, password), throwsA(isInstanceOf<ValidationError>()));
    expect(() => emailAuthentication(email6, password), throwsA(isInstanceOf<ValidationError>()));
    expect(() => emailAuthentication(email7, password), throwsA(isInstanceOf<ValidationError>()));
    expect(() => emailAuthentication(email8, password), throwsA(isInstanceOf<ValidationError>()));
  });

  test("[SignUp] should throw [ValidationError] when password has an invalid format", () async {
    final password2 = "a1";
    final password3 = "a12";
    final password4 = "a123";
    final password5 = "a1234";
    final password6 = "123456";
    final password7 = "ABCDEFG";

    expect(() => emailAuthentication(email, password2), throwsA(isInstanceOf<ValidationError>()));
    expect(() => emailAuthentication(email, password3), throwsA(isInstanceOf<ValidationError>()));
    expect(() => emailAuthentication(email, password4), throwsA(isInstanceOf<ValidationError>()));
    expect(() => emailAuthentication(email, password5), throwsA(isInstanceOf<ValidationError>()));
    expect(() => emailAuthentication(email, password6), throwsA(isInstanceOf<ValidationError>()));
    expect(() => emailAuthentication(email, password7), throwsA(isInstanceOf<ValidationError>()));
  });
}
