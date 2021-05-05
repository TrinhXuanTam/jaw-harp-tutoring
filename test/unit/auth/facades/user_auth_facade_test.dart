import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';
import 'package:jews_harp/features/auth/infrastructure/external_services/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: FirebaseAuthService, env: [USER_AUTH_FACADE_TEST_ENV])
class FirebaseAuthServiceMock extends Mock implements FirebaseAuthService {}

void main() {
  testConfigureDependencies(USER_AUTH_FACADE_TEST_ENV);

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
    final firebaseAuthServiceMock = serviceLocator<FirebaseAuthService>();
    reset(firebaseAuthServiceMock);
  });

  test("[signUpWithEmailAndPassword] should return 'User' entity if account was created.", () async {
    final userAuthFacade = serviceLocator<IUserAuthFacade>();
    final firebaseAuthServiceMock = serviceLocator<FirebaseAuthService>();
    when(() => firebaseAuthServiceMock.signUpWithEmail(name, email, password)).thenAnswer((_) async => user);

    final res = await userAuthFacade.signUpWithEmailAndPassword(name, email, password);

    expect(res.uid, uid);
    expect(res.name, name);
    expect(res.email, email);
    expect(res.isVerified, isVerified);
  });

  test("[signInWithEmailAndPassword] should return 'User' entity if account exists.", () async {
    final userAuthFacade = serviceLocator<IUserAuthFacade>();
    final firebaseAuthServiceMock = serviceLocator<FirebaseAuthService>();
    when(() => firebaseAuthServiceMock.signInWithEmail(email, password)).thenAnswer((_) async => user);

    final res = await userAuthFacade.signInWithEmailAndPassword(email, password);

    expect(res.uid, uid);
    expect(res.name, name);
    expect(res.email, email);
    expect(res.isVerified, isVerified);
  });

  test("[signInWithGoogle] should return 'User' entity if Google account exists.", () async {
    final userAuthFacade = serviceLocator<IUserAuthFacade>();
    final firebaseAuthServiceMock = serviceLocator<FirebaseAuthService>();
    when(() => firebaseAuthServiceMock.signInWithGoogle()).thenAnswer((_) async => user);

    final res = await userAuthFacade.signInWithGoogle();

    expect(res.uid, uid);
    expect(res.name, name);
    expect(res.email, email);
    expect(res.isVerified, isVerified);
  });

  test("[signInWithFacebook] should return 'User' entity if Facebook profile exists.", () async {
    final userAuthFacade = serviceLocator<IUserAuthFacade>();
    final firebaseAuthServiceMock = serviceLocator<FirebaseAuthService>();
    when(() => firebaseAuthServiceMock.signInWithFacebook()).thenAnswer((_) async => user);

    final res = await userAuthFacade.signInWithFacebook();

    expect(res.uid, uid);
    expect(res.name, name);
    expect(res.email, email);
    expect(res.isVerified, isVerified);
  });

  test("[linkAccountToEmail] should return 'User' entity if linking account to email and password was successful.", () async {
    final userAuthFacade = serviceLocator<IUserAuthFacade>();
    final firebaseAuthServiceMock = serviceLocator<FirebaseAuthService>();
    when(() => firebaseAuthServiceMock.linkAccountToEmail(email, password)).thenAnswer((_) async => user);

    final res = await userAuthFacade.linkAccountToEmail(email, password);

    expect(res.uid, uid);
    expect(res.name, name);
    expect(res.email, email);
    expect(res.isVerified, isVerified);
  });

  test("[linkAccountToFacebook] should return 'User' entity if linking account to Facebook profile was successful.", () async {
    final userAuthFacade = serviceLocator<IUserAuthFacade>();
    final firebaseAuthServiceMock = serviceLocator<FirebaseAuthService>();
    when(() => firebaseAuthServiceMock.linkAccountToFacebook()).thenAnswer((_) async => user);

    final res = await userAuthFacade.linkAccountToFacebook();

    expect(res.uid, uid);
    expect(res.name, name);
    expect(res.email, email);
    expect(res.isVerified, isVerified);
  });
}
