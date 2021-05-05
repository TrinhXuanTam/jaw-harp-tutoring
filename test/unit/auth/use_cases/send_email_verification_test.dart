


// void main() {
//   testConfigureDependencies(SEND_EMAIL_VERIFICATION_TEST_ENV);
//
//   final sendEmailVerification = testServiceLocator<SendEmailVerification>();
//
//   test("[SendEmailVerification] should throw [UserNotSignedInError] when user is not signed in", () async {
//     when(() => testServiceLocator<IUserFacade>().sendVerificationEmail()).thenThrow(UserNotSignedInError());
//     expect(() => sendEmailVerification(), throwsA(isInstanceOf<UserNotSignedInError>()));
//   });
// }
