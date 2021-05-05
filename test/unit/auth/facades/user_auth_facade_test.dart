import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/errors/wrong_email_or_password_error.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart';
import 'package:jews_harp/features/auth/infrastructure/external_services/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';


// void main() {
//   testConfigureDependencies(USER_AUTH_FACADE_TEST_ENV);
//
//   // Reset mock objects before each test.
//   setUp(() {
//     final firebaseAuthServiceMock = testServiceLocator<FirebaseAuthService>();
//     reset(firebaseAuthServiceMock);
//   });
//
//   // final uid = "0";
//   // final name = "John Doe";
//   // final email = "john.doe@gmail.com";
//   // final password = "John123456";
//
//   test("[UserAuthFacade.signInWithEmail] should throw 'WrongEmailOrPasswordError' when invalid credentials are given", () async {
//     final nonExistentEmail = "NON-EXISTENT";
//     final nonExistentPassword = "NON-EXISTENT";
//     final firebaseAuthServiceMock = testServiceLocator<FirebaseAuthService>();
//     final userAuthFacade = serviceLocator<IUserAuthFacade>();
//
//     when(() => firebaseAuthServiceMock.signInWithEmail(nonExistentEmail, nonExistentPassword)).thenThrow(WrongEmailOrPasswordError());
//
//     expect(
//       () => userAuthFacade.signInWithEmailAndPassword(nonExistentEmail, nonExistentPassword),
//       throwsA(isInstanceOf<WrongEmailOrPasswordError>()),
//     );
//   });
//
//   test("[UserRepository.getUserWithEmailAndPassword] should return user data when correct credentials are given", () async {
//     when(() => testServiceLocator<FirebaseAuthDataSource>().signInWithEmail(email, password)).thenAnswer(
//       (_) async => UserDTO(uid: uid, name: name, email: email),
//     );
//
//     final userRepository = serviceLocator<IUserAuthRepository>();
//     final user = await userRepository.getUserWithEmailAndPassword(email, password);
//
//     expect(user.email, email);
//     expect(user.name, name);
//     expect(user.uid, uid);
//   });
//
//   test("[UserRepository.createUser] should return 'Optional.empty()' when user already exists", () async {
//     when(() => testServiceLocator<FirebaseAuthDataSource>().signUpWithEmail(name, email, password)).thenThrow(EmailAlreadyUsedError(email));
//
//     final userRepository = serviceLocator<IUserAuthRepository>();
//
//     expect(() => userRepository.createUser(name, email, password), throwsA(isInstanceOf<EmailAlreadyUsedError>()));
//   });
//
//   test("[UserRepository.createUser] should return user data when user account successfully created", () async {
//     when(() => testServiceLocator<FirebaseAuthDataSource>().signUpWithEmail(name, email, password)).thenAnswer(
//       (_) async => UserDTO(uid: uid, name: name, email: email),
//     );
//
//     final userRepository = serviceLocator<IUserAuthRepository>();
//     final user = await userRepository.createUser(name, email, password);
//
//     expect(user.email, email);
//     expect(user.name, name);
//     expect(user.uid, uid);
//   });
//
//   test("[UserRepository.getCurrentUser] should return user when data is cached", () async {
//     when(() => testServiceLocator<FirebaseAuthDataSource>().getCurrentUser()).thenAnswer(
//       (_) async => UserDTO(uid: uid, name: name, email: email),
//     );
//
//     final userRepository = serviceLocator<IUserAuthRepository>();
//     final user = await userRepository.getCurrentUser();
//
//     expect(user != null, true);
//
//     expect(user!.email, email);
//     expect(user.name, name);
//     expect(user.uid, uid);
//   });
//
//   test("[UserRepository.getCurrentUser] should return 'Optional.empty()' when data is not cached", () async {
//     when(() => testServiceLocator<FirebaseAuthDataSource>().getCurrentUser()).thenAnswer((_) async => null);
//
//     final userRepository = serviceLocator<IUserAuthRepository>();
//     final user = await userRepository.getCurrentUser();
//
//     expect(user, null);
//   });
//
//   test("[UserRepository.getCurrentUser] should return 'Optional.empty()' when account is not verified", () async {
//     when(() => testServiceLocator<FirebaseAuthDataSource>().getCurrentUser()).thenAnswer((_) async => null);
//
//     final userRepository = serviceLocator<IUserAuthRepository>();
//     final user = await userRepository.getCurrentUser();
//
//     expect(user, null);
//   });
// }
