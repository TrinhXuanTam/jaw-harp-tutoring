


// void main() {
//   testConfigureDependencies(LINK_FACEBOOK_PROVIDER_TEST_ENV);
//
//   final uid = "0";
//   final name = "John Doe";
//   final email = "john.doe@gmail.com";
//
//   final linkFacebookProvider = testServiceLocator<LinkFacebookProvider>();
//
//   test("[LinkFacebookProvider] should user data when account was linked to Facebook", () async {
//     when(() => testServiceLocator<IUserFacade>().linkAccountToFacebook()).thenAnswer(
//       (_) async => UserDTO(uid: uid, name: name, email: email),
//     );
//
//     final user = await linkFacebookProvider();
//
//     expect(user.uid, uid);
//     expect(user.name, name);
//     expect(user.email, email);
//   });
//
//   test("[LinkFacebookProvider] should throw [UserNotSignedInError] when user is not signed in", () async {
//     when(() => testServiceLocator<IUserFacade>().linkAccountToFacebook()).thenThrow(UserNotSignedInError());
//     expect(() => linkFacebookProvider(), throwsA(isInstanceOf<UserNotSignedInError>()));
//   });
// }
