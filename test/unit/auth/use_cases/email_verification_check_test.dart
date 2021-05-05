

// void main() {
//   testConfigureDependencies(EMAIL_VERIFICATION_CHECK_TEST_ENV);
//   final emailIsVerified = testServiceLocator<EmailIsVerified>();
//
//   test("[EmailIsVerified] should return true when user is verified", () async {
//     when(() => testServiceLocator<IUserFacade>().isVerified()).thenAnswer((_) async => true);
//     expect(await emailIsVerified(), true);
//   });
//
//   test("[EmailIsVerified] should return false when user is not verified", () async {
//     when(() => testServiceLocator<IUserFacade>().isVerified()).thenAnswer((_) async => false);
//     expect(await emailIsVerified(), false);
//   });
// }
