


// void main() {
//   testConfigureDependencies(PASSWORD_RESET_TEST_ENV);
//
//   final email = "john.doe@gmail.com";
//
//   final passwordReset = testServiceLocator<PasswordReset>();
//
//   test("[PasswordReset] should throw [ValidationError] when email is empty", () async {
//     expect(() => passwordReset(""), throwsA(isInstanceOf<ValidationError>()));
//   });
//
//   test("[PasswordReset] should throw [ValidationError] when email has invalid format", () async {
//     final email2 = "test.com";
//     final email3 = "@test.com";
//     final email4 = "test@.com";
//     final email5 = "test.com";
//     final email6 = "test@test";
//     final email7 = "test@test.";
//     final email8 = "";
//
//     expect(() => passwordReset(email2), throwsA(isInstanceOf<ValidationError>()));
//     expect(() => passwordReset(email3), throwsA(isInstanceOf<ValidationError>()));
//     expect(() => passwordReset(email4), throwsA(isInstanceOf<ValidationError>()));
//     expect(() => passwordReset(email5), throwsA(isInstanceOf<ValidationError>()));
//     expect(() => passwordReset(email6), throwsA(isInstanceOf<ValidationError>()));
//     expect(() => passwordReset(email7), throwsA(isInstanceOf<ValidationError>()));
//     expect(() => passwordReset(email8), throwsA(isInstanceOf<ValidationError>()));
//   });
//
//   test("[PasswordReset] should throw [EmailNotFoundError] when user account doesn't exist", () async {
//     when(() => testServiceLocator<IUserFacade>().resetPassword(email)).thenAnswer((_) async => false);
//     expect(() => passwordReset(email), throwsA(isInstanceOf<EmailNotFoundError>()));
//   });
// }
