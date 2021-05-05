


// void main() {
//   testConfigureDependencies(FACEBOOK_AUTHENTICATION_TEST_ENV);
//
//   final uid = "0";
//   final name = "John Doe";
//   final email = "john.doe@gmail.com";
//   final facebookAuthentication = testServiceLocator<FacebookAuthentication>();
//
//   test("[FacebookAuthentication] should return user data when user signs into facebook", () async {
//     when(() => testServiceLocator<IUserAuthRepository>().getUserWithFacebook()).thenAnswer(
//       (_) async => User(uid: uid, name: name, email: email),
//     );
//
//     final user = await facebookAuthentication();
//
//     expect(user.uid, uid);
//     expect(user.name, name);
//     expect(user.email, email);
//   });
//
//   test("[FacebookAuthentication] should throw [WrongEmailOrPasswordError] when user fails to log into facebook", () async {
//     when(() => testServiceLocator<IUserAuthRepository>().getUserWithFacebook()).thenThrow(WrongEmailOrPasswordError());
//     expect(() => facebookAuthentication(), throwsA(isInstanceOf<WrongEmailOrPasswordError>()));
//   });
// }
