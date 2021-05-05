import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/auth_providers_id.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: FirebaseAuthDataSource, env: [USER_AUTH_REPOSITORY_TEST_ENV])
class FirebaseAuthDataSourceMock extends Mock implements FirebaseAuthDataSource {}

void main() {
  testConfigureDependencies(USER_AUTH_REPOSITORY_TEST_ENV);

  final user = UserDTO(
    uid: "0",
    name: "John Doe",
    email: "john.doe@gmail.com",
    isVerified: true,
  );

  final providers = {
    FACEBOOK_PROVIDER,
    GOOGLE_PROVIDER,
    EMAIL_PROVIDER,
  };

  // Reset mock objects before each test.
  setUp(() {
    final firebaseAuthDataSourceMock = serviceLocator<FirebaseAuthDataSource>();
    reset(firebaseAuthDataSourceMock);
  });

  test("[getCurrentUser] should return online 'User' entity if user is signed in.", () async {
    final userAuthRepository = serviceLocator<IUserAuthRepository>();
    final firebaseAuthDataSourceMock = serviceLocator<FirebaseAuthDataSource>();
    when(() => firebaseAuthDataSourceMock.getCurrentUser(true)).thenAnswer((_) async => user);

    final res = await userAuthRepository.getCurrentUser(true);

    expect(res, user);
  });

  test("[getCurrentUser] should return online 'offline' entity if user is signed in.", () async {
    final userAuthRepository = serviceLocator<IUserAuthRepository>();
    final firebaseAuthDataSourceMock = serviceLocator<FirebaseAuthDataSource>();
    when(() => firebaseAuthDataSourceMock.getCurrentUser(true)).thenAnswer((_) async => user);

    final res = await userAuthRepository.getCurrentUser(true);

    expect(res, user);
  });

  test("[getCurrentUser] should return null if no user is signed in.", () async {
    final userAuthRepository = serviceLocator<IUserAuthRepository>();
    final firebaseAuthDataSourceMock = serviceLocator<FirebaseAuthDataSource>();
    when(() => firebaseAuthDataSourceMock.getCurrentUser(true)).thenAnswer((_) async => null);

    final res = await userAuthRepository.getCurrentUser(true);

    expect(res, null);
  });

  test("[reloadUser] should return 'User' entity if user is signed in.", () async {
    final userAuthRepository = serviceLocator<IUserAuthRepository>();
    final firebaseAuthDataSourceMock = serviceLocator<FirebaseAuthDataSource>();
    when(() => firebaseAuthDataSourceMock.reloadUser()).thenAnswer((_) async => user);

    final res = await userAuthRepository.reloadUser();

    expect(res, user);
  });

  test("[getAuthProviders] should return 'User' entity if user is signed in.", () async {
    final userAuthRepository = serviceLocator<IUserAuthRepository>();
    final firebaseAuthDataSourceMock = serviceLocator<FirebaseAuthDataSource>();
    when(() => firebaseAuthDataSourceMock.getAuthProviders(user.email)).thenAnswer((_) async => providers);

    final res = await userAuthRepository.getAuthProviders(user.email);

    expect(res, providers);
  });
}
