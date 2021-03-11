import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/errors/email_already_used_error.dart';
import 'package:jews_harp/core/errors/wrong_email_or_password_error.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../dependency_injection/test_service_locator.dart';

void main() {
  testConfigureDependencies(USER_REPOSITORY_TEST_ENV);

  final uid = "0";
  final name = "John Doe";
  final email = "john.doe@gmail.com";
  final password = "John123456";

  test("[UserRepository.getUserWithEmailAndPassword] should return 'Optional.empty()' when invalid credentials are given", () async {
    final nonExistentEmail = "NON-EXISTENT";
    final nonExistentPassword = "NON-EXISTENT";

    when(() => testServiceLocator<FirebaseAuthDataSource>().signInWithEmail(nonExistentEmail, nonExistentPassword)).thenThrow(WrongEmailOrPasswordError());

    final userRepository = serviceLocator<IUserRepository>();

    expect(() => userRepository.getUserWithEmailAndPassword(nonExistentPassword, nonExistentPassword), throwsA(isInstanceOf<WrongEmailOrPasswordError>()));
  });

  test("[UserRepository.getUserWithEmailAndPassword] should return user data when correct credentials are given", () async {
    when(() => testServiceLocator<FirebaseAuthDataSource>().signInWithEmail(email, password)).thenAnswer(
      (_) async => UserDTO(uid: uid, name: name, email: email),
    );

    final userRepository = serviceLocator<IUserRepository>();
    final user = await userRepository.getUserWithEmailAndPassword(email, password);

    expect(user.email, email);
    expect(user.name, name);
    expect(user.uid, uid);
  });

  test("[UserRepository.createUser] should return 'Optional.empty()' when user already exists", () async {
    when(() => testServiceLocator<FirebaseAuthDataSource>().signUpWithEmail(name, email, password)).thenThrow(EmailAlreadyUsedError(email));

    final userRepository = serviceLocator<IUserRepository>();

    expect(() => userRepository.createUser(name, email, password), throwsA(isInstanceOf<EmailAlreadyUsedError>()));
  });

  test("[UserRepository.createUser] should return user data when user account successfully created", () async {
    when(() => testServiceLocator<FirebaseAuthDataSource>().signUpWithEmail(name, email, password)).thenAnswer(
      (_) async => UserDTO(uid: uid, name: name, email: email),
    );

    final userRepository = serviceLocator<IUserRepository>();
    final user = await userRepository.createUser(name, email, password);

    expect(user.email, email);
    expect(user.name, name);
    expect(user.uid, uid);
  });

  test("[UserRepository.getCurrentUser] should return user when data is cached", () async {
    when(() => testServiceLocator<FirebaseAuthDataSource>().getCurrentUser()).thenAnswer(
      (_) async => UserDTO(uid: uid, name: name, email: email),
    );

    final userRepository = serviceLocator<IUserRepository>();
    final user = await userRepository.getCurrentUser();

    expect(user != null, true);

    expect(user!.email, email);
    expect(user.name, name);
    expect(user.uid, uid);
  });

  test("[UserRepository.getCurrentUser] should return 'Optional.empty()' when data is not cached", () async {
    when(() => testServiceLocator<FirebaseAuthDataSource>().getCurrentUser()).thenAnswer((_) async => null);

    final userRepository = serviceLocator<IUserRepository>();
    final user = await userRepository.getCurrentUser();

    expect(user, null);
  });

  test("[UserRepository.getCurrentUser] should return 'Optional.empty()' when account is not verified", () async {
    when(() => testServiceLocator<FirebaseAuthDataSource>().getCurrentUser()).thenAnswer((_) async => null);

    final userRepository = serviceLocator<IUserRepository>();
    final user = await userRepository.getCurrentUser();

    expect(user, null);
  });
}
