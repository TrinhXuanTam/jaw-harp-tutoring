import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/errors/validation_error.dart';
import 'package:jews_harp/features/auth/application/use_cases/sign_up.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: IUserAuthFacade, env: [SIGN_UP_TEST_ENV])
class UserAuthFacade extends Mock implements IUserAuthFacade {}

void main() {
  testConfigureDependencies(SIGN_UP_TEST_ENV);

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

  setUp(() {
    final userAuthFacade = serviceLocator<IUserAuthFacade>();
    reset(userAuthFacade);
  });

  test("[SignUp] should return user data when credentials are correct", () async {
    final signUp = serviceLocator<SignUp>();
    final userAuthFacade = serviceLocator<IUserAuthFacade>();
    when(() => userAuthFacade.signUpWithEmailAndPassword(name, email, password)).thenAnswer((_) async => user);

    final res = await signUp(name, email, password, password);

    expect(res, user);
  });

  test("[SignUp] should throw [ValidationError] when passwords do not match", () async {
    final signUp = serviceLocator<SignUp>();
    final passwordRepeat = "TEST";

    expect(
      () => signUp(name, email, password, passwordRepeat),
      throwsA(isInstanceOf<ValidationError>()),
    );
  });

  test("[SignUp] should throw [ValidationError] when email has invalid format", () async {
    final signUp = serviceLocator<SignUp>();
    final email2 = "test.com";
    final email3 = "@test.com";
    final email4 = "test@.com";
    final email5 = "test.com";
    final email6 = "test@test";
    final email7 = "test@test.";
    final email8 = "";

    expect(() => signUp(name, email2, password, password), throwsA(isInstanceOf<ValidationError>()));
    expect(() => signUp(name, email3, password, password), throwsA(isInstanceOf<ValidationError>()));
    expect(() => signUp(name, email4, password, password), throwsA(isInstanceOf<ValidationError>()));
    expect(() => signUp(name, email5, password, password), throwsA(isInstanceOf<ValidationError>()));
    expect(() => signUp(name, email6, password, password), throwsA(isInstanceOf<ValidationError>()));
    expect(() => signUp(name, email7, password, password), throwsA(isInstanceOf<ValidationError>()));
    expect(() => signUp(name, email8, password, password), throwsA(isInstanceOf<ValidationError>()));
  });

  test("[SignUp] should throw [ValidationError] when password is too weak", () async {
    final signUp = serviceLocator<SignUp>();
    final password2 = "a1";
    final password3 = "a12";
    final password4 = "a123";
    final password5 = "a1234";
    final password6 = "123456";
    final password7 = "ABCDEFG";

    expect(() => signUp(name, email, password2, password2), throwsA(isInstanceOf<ValidationError>()));
    expect(() => signUp(name, email, password3, password3), throwsA(isInstanceOf<ValidationError>()));
    expect(() => signUp(name, email, password4, password4), throwsA(isInstanceOf<ValidationError>()));
    expect(() => signUp(name, email, password5, password5), throwsA(isInstanceOf<ValidationError>()));
    expect(() => signUp(name, email, password6, password6), throwsA(isInstanceOf<ValidationError>()));
    expect(() => signUp(name, email, password7, password7), throwsA(isInstanceOf<ValidationError>()));
  });
}
