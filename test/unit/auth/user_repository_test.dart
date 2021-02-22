import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as Injectable;
import 'package:jews_harp/core/constants.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/errors/email_already_used_error.dart';
import 'package:jews_harp/core/errors/wrong_email_or_password_error.dart';
import 'package:jews_harp/features/auth/data/data_source_interfaces/local/authentication_local.dart';
import 'package:jews_harp/features/auth/data/data_source_interfaces/remote/authentication_remote.dart';
import 'package:jews_harp/features/auth/data/models/user_model.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:mockito/mockito.dart';

import '../../dependency_injection/test_service_locator.dart';

// ignore: must_be_immutable
class UserDataMock extends Mock implements UserModel {
  final String uid;
  final String name;
  final String email;
  final String password;

  UserDataMock(this.uid, this.name, this.email, this.password);
}

@Injectable.LazySingleton(as: IAuthenticationRemoteDataSource, env: [USER_REPOSITORY_TEST_ENV])
class IAuthenticationRemoteDataSourceMock extends Mock implements IAuthenticationRemoteDataSource {}

@Injectable.LazySingleton(as: IAuthenticationLocalDataSource, env: [USER_REPOSITORY_TEST_ENV])
class IAuthenticationLocalDataSourceMock extends Mock implements IAuthenticationLocalDataSource {}

void main() {
  testConfigureDependencies(USER_REPOSITORY_TEST_ENV);

  test("should return [Optional.empty()]", () async {
    final email = "NON-EXISTENT";
    final password = "NON-EXISTENT";

    when(testServiceLocator<IAuthenticationRemoteDataSource>().getUser(email, password)).thenThrow(
      WrongEmailOrPasswordError(),
    );

    final userRepository = serviceLocator<IUserRepository>();
    final user = await userRepository.getUserWithEmailAndPassword(email, password);

    assert(user.isEmpty);
  });

  test("should return user data", () async {
    final uid = "0";
    final name = "John Doe";
    final email = "john.doe@gmail.com";
    final password = "John123456";

    when(testServiceLocator<IAuthenticationRemoteDataSource>().getUser(email, password)).thenAnswer(
      (_) async => UserDataMock(uid, name, email, password),
    );

    final userRepository = serviceLocator<IUserRepository>();
    final user = await userRepository.getUserWithEmailAndPassword(email, password);

    assert(user.isPresent);
    final userData = user.value;

    assert(userData.email == email);
    assert(userData.name == name);
    assert(userData.uid == uid);
  });
}
