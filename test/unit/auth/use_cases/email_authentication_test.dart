import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/errors/validation_error.dart';
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: IUserAuthFacade, env: [EMAIL_AUTHENTICATION_TEST_ENV])
class UserAuthFacade extends Mock implements IUserAuthFacade {}

void main() {
  testConfigureDependencies(EMAIL_AUTHENTICATION_TEST_ENV);

  final uid = "0";
  final name = "John Doe";
  final email = "john.doe@gmail.com";
  final password = "John123456789";
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

  test("[EmailAuthentication] should return user data when correct credentials are given", () async {
    final emailAuthentication = serviceLocator<EmailAuthentication>();
    final userAuthFacade = serviceLocator<IUserAuthFacade>();
    when(() => userAuthFacade.signInWithEmailAndPassword(email, password)).thenAnswer((_) async => user);

    final res = await emailAuthentication(email, password);

    expect(res.email, email);
    expect(res.name, name);
    expect(res.uid, uid);
    expect(res.isVerified, isVerified);
  });

  test("[EmailAuthentication] should throw [ValidationError] when email has invalid format", () async {
    final emailAuthentication = serviceLocator<EmailAuthentication>();
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

  test("[EmailAuthentication] should throw [ValidationError] when password has an invalid format", () async {
    final emailAuthentication = serviceLocator<EmailAuthentication>();
    final password2 = "a1";
    final password3 = "a12";
    final password4 = "a123";
    final password5 = "a1234";
    final password6 = "123456";
    final password7 = "ABCDEFG";
    final password8 = "";

    expect(() => emailAuthentication(email, password2), throwsA(isInstanceOf<ValidationError>()));
    expect(() => emailAuthentication(email, password3), throwsA(isInstanceOf<ValidationError>()));
    expect(() => emailAuthentication(email, password4), throwsA(isInstanceOf<ValidationError>()));
    expect(() => emailAuthentication(email, password5), throwsA(isInstanceOf<ValidationError>()));
    expect(() => emailAuthentication(email, password6), throwsA(isInstanceOf<ValidationError>()));
    expect(() => emailAuthentication(email, password7), throwsA(isInstanceOf<ValidationError>()));
    expect(() => emailAuthentication(email, password8), throwsA(isInstanceOf<ValidationError>()));
  });
}
