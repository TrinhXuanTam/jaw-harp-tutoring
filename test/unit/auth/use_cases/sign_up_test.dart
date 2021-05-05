

// void main() {
//   testConfigureDependencies(SIGN_UP_TEST_ENV);
//
//   final uid = "0";
//   final name = "John Doe";
//   final email = "john.doe@gmail.com";
//   final password = "John123456";
//   final signUp = testServiceLocator<SignUp>();
//
//   when(() => testServiceLocator<IUserAuthRepository>().createUser(name, email, password)).thenAnswer(
//     (_) async => User(uid: uid, name: name, email: email),
//   );
//
//   test("[SignUp] should return user data when credentials are correct", () async {
//     final user = await signUp(name, email, password, password);
//
//     expect(user.email, email);
//     expect(user.name, name);
//     expect(user.uid, uid);
//   });
//
//   test("[SignUp] should throw [ValidationError] when passwords do not match", () async {
//     final passwordRepeat = "TEST";
//
//     expect(
//       () => signUp(name, email, password, passwordRepeat),
//       throwsA(isInstanceOf<ValidationError>()),
//     );
//   });
//
//   test("[SignUp] should throw [ValidationError] when email has invalid format", () async {
//     final email2 = "test.com";
//     final email3 = "@test.com";
//     final email4 = "test@.com";
//     final email5 = "test.com";
//     final email6 = "test@test";
//     final email7 = "test@test.";
//     final email8 = "";
//
//     expect(() => signUp(name, email2, password, password), throwsA(isInstanceOf<ValidationError>()));
//     expect(() => signUp(name, email3, password, password), throwsA(isInstanceOf<ValidationError>()));
//     expect(() => signUp(name, email4, password, password), throwsA(isInstanceOf<ValidationError>()));
//     expect(() => signUp(name, email5, password, password), throwsA(isInstanceOf<ValidationError>()));
//     expect(() => signUp(name, email6, password, password), throwsA(isInstanceOf<ValidationError>()));
//     expect(() => signUp(name, email7, password, password), throwsA(isInstanceOf<ValidationError>()));
//     expect(() => signUp(name, email8, password, password), throwsA(isInstanceOf<ValidationError>()));
//   });
//
//   test("[SignUp] should throw [ValidationError] when password is too weak", () async {
//     final password2 = "a1";
//     final password3 = "a12";
//     final password4 = "a123";
//     final password5 = "a1234";
//     final password6 = "123456";
//     final password7 = "ABCDEFG";
//
//     expect(() => signUp(name, email, password2, password2), throwsA(isInstanceOf<ValidationError>()));
//     expect(() => signUp(name, email, password3, password3), throwsA(isInstanceOf<ValidationError>()));
//     expect(() => signUp(name, email, password4, password4), throwsA(isInstanceOf<ValidationError>()));
//     expect(() => signUp(name, email, password5, password5), throwsA(isInstanceOf<ValidationError>()));
//     expect(() => signUp(name, email, password6, password6), throwsA(isInstanceOf<ValidationError>()));
//     expect(() => signUp(name, email, password7, password7), throwsA(isInstanceOf<ValidationError>()));
//   });
//
//   test("[SignUp] should throw [EmailAlreadyUsedError] when email is already used", () async {
//     final takenEmail = "taken@gmail.com";
//
//     when(() => testServiceLocator<IUserAuthRepository>().createUser(name, takenEmail, password)).thenThrow(EmailAlreadyUsedError(email));
//
//     expect(() => signUp(name, takenEmail, password, password), throwsA(isInstanceOf<EmailAlreadyUsedError>()));
//   });
// }
