

// void main() {
//   testConfigureDependencies(GOOGLE_AUTHENTICATION_TEST_ENV);
//
//   final uid = "0";
//   final name = "John Doe";
//   final email = "john.doe@gmail.com";
//   final googleAuthentication = testServiceLocator<GoogleAuthentication>();
//
//   test("[GoogleAuthentication] should return user data when user signs into google", () async {
//     when(() => testServiceLocator<IUserAuthRepository>().getUserWithGoogle()).thenAnswer(
//       (_) async => User(uid: uid, name: name, email: email),
//     );
//
//     final user = await googleAuthentication();
//
//     expect(user.uid, uid);
//     expect(user.name, name);
//     expect(user.email, email);
//   });
//
//   test("[GoogleAuthentication] should throw [WrongEmailOrPasswordError] when user fails to log into google", () async {
//     when(() => testServiceLocator<IUserAuthRepository>().getUserWithGoogle()).thenThrow(WrongEmailOrPasswordError());
//     expect(() => googleAuthentication(), throwsA(isInstanceOf<WrongEmailOrPasswordError>()));
//   });
// }
