


// void main() {
//   testConfigureDependencies(GET_CURRENT_USER_TEST_ENV);
//
//   final uid = "0";
//   final name = "John Doe";
//   final email = "john.doe@gmail.com";
//   final getCurrentUser = testServiceLocator<GetCurrentUser>();
//
//   test("[GetCurrentUser] should return user data when user is returned from local data source", () async {
//     when(() => testServiceLocator<IUserAuthRepository>().getCurrentUser()).thenAnswer(
//       (_) async => User(uid: uid, name: name, email: email),
//     );
//
//     final user = await getCurrentUser();
//
//     expect(user != null, true);
//     expect(user!.email, email);
//     expect(user.name, name);
//     expect(user.uid, uid);
//   });
//
//   test("[GetCurrentUser] should return null when user data is not found in local data source", () async {
//     when(() => testServiceLocator<IUserAuthRepository>().getCurrentUser()).thenAnswer(
//       (_) async => null,
//     );
//
//     expect(await getCurrentUser(), null);
//   });
// }
