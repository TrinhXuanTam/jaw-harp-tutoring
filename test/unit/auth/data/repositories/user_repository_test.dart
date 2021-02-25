import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/auth/data/data%20_sources/interfaces/local/authentication_local.dart';
import 'package:jews_harp/features/auth/data/data%20_sources/interfaces/remote/authentication_remote.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:mockito/mockito.dart';
import 'package:optional/optional.dart';

import '../../../../dependency_injection/mock.dart';
import '../../../../dependency_injection/test_service_locator.dart';

void main() {
  testConfigureDependencies(USER_REPOSITORY_TEST_ENV);

  final uid = "0";
  final name = "John Doe";
  final email = "john.doe@gmail.com";
  final password = "John123456";

  test("[IAuthenticationRemoteDataSource.getUserWithEmailAndPassword] should return 'Optional.empty()' when invalid credentials are given", () async {
    final nonExistentEmail = "NON-EXISTENT";
    final nonExistentPassword = "NON-EXISTENT";

    when(testServiceLocator<IAuthenticationRemoteDataSource>().getUser(nonExistentEmail, nonExistentPassword)).thenAnswer((_) async => Optional.empty());

    final userRepository = serviceLocator<IUserRepository>();
    final user = await userRepository.getUserWithEmailAndPassword(nonExistentPassword, nonExistentPassword);

    assert(user.isEmpty);
  });

  test("[IAuthenticationRemoteDataSource.getUserWithEmailAndPassword] should return user data when correct credentials are given", () async {
    when(testServiceLocator<IAuthenticationRemoteDataSource>().getUser(email, password)).thenAnswer(
      (_) async => Optional.of(UserModelMock(uid, name, email, password)),
    );

    final userRepository = serviceLocator<IUserRepository>();
    final user = await userRepository.getUserWithEmailAndPassword(email, password);

    assert(user.isPresent);
    final userData = user.value;

    assert(userData.email == email);
    assert(userData.name == name);
    assert(userData.uid == uid);
  });

  test("[IAuthenticationRemoteDataSource.createUser] should return 'Optional.empty()' when user already exists", () async {
    when(testServiceLocator<IAuthenticationRemoteDataSource>().createNewUser(name, email, password)).thenAnswer((_) async => Optional.empty());

    final userRepository = serviceLocator<IUserRepository>();
    final user = await userRepository.createUser(name, email, password);

    assert(user.isEmpty);
  });

  test("[IAuthenticationRemoteDataSource.createUser] should return user data when user account successfully created", () async {
    when(testServiceLocator<IAuthenticationRemoteDataSource>().createNewUser(name, email, password)).thenAnswer(
      (_) async => Optional.of(UserModelMock(uid, name, email, password)),
    );

    final userRepository = serviceLocator<IUserRepository>();
    final user = await userRepository.createUser(name, email, password);

    assert(user.isPresent);
    final userData = user.value;

    assert(userData.email == email);
    assert(userData.name == name);
    assert(userData.uid == uid);
  });

  test("[IAuthenticationRemoteDataSource.getCurrentUser] should return user when data is cached", () async {
    final uid = "0";
    final name = "John Doe";
    final email = "john.doe@gmail.com";
    final password = "John123456";

    when(testServiceLocator<IAuthenticationLocalDataSource>().getCurrentUser()).thenAnswer(
      (_) async => Optional.of(UserModelMock(uid, name, email, password)),
    );

    final userRepository = serviceLocator<IUserRepository>();
    final user = await userRepository.getCurrentUser();

    assert(user.isPresent);
    final userData = user.value;

    assert(userData.email == email);
    assert(userData.name == name);
    assert(userData.uid == uid);
  });

  test("[IAuthenticationRemoteDataSource.getCurrentUser] should return 'Optional.empty()' when data is not cached", () async {
    when(testServiceLocator<IAuthenticationLocalDataSource>().getCurrentUser()).thenAnswer((_) async => Optional.empty());

    final userRepository = serviceLocator<IUserRepository>();
    final user = await userRepository.getCurrentUser();

    assert(user.isEmpty);
  });

  test("[IAuthenticationRemoteDataSource.getCurrentUser] should return 'Optional.empty()' when account is not verified", () async {
    when(testServiceLocator<IAuthenticationLocalDataSource>().getCurrentUser()).thenAnswer((_) async => Optional.empty());

    final userRepository = serviceLocator<IUserRepository>();
    final user = await userRepository.getCurrentUser();

    assert(user.isEmpty);
  });
}
