

// void main() {
//   testConfigureDependencies(GET_AUTHENTICATION_PROVIDERS_TEST_ENV);
//   final getAuthProviders = serviceLocator<GetAuthProviders>();
//   final email = "john.doe@gmail.com";
//
//   test("[GetAuthProviders] should return set of authentication providers when user when user has multiple authentication providers", () async {
//     when(() => testServiceLocator<IUserAuthRepository>().getAuthProviders(email)).thenAnswer(
//       (_) async => Set<String>.of([FACEBOOK_PROVIDER, GOOGLE_PROVIDER, EMAIL_PROVIDER]),
//     );
//
//     final providers = await getAuthProviders(email);
//     expect(providers.isNotEmpty, true);
//     expect(providers.contains(FACEBOOK_PROVIDER), true);
//     expect(providers.contains(GOOGLE_PROVIDER), true);
//     expect(providers.contains(EMAIL_PROVIDER), true);
//   });
//
//   test("[GetAuthProviders] should return empty set when user when user doesn't exist", () async {
//     when(() => testServiceLocator<IUserAuthRepository>().getAuthProviders(email)).thenAnswer(
//       (_) async => Set(),
//     );
//
//     final providers = await getAuthProviders(email);
//     expect(providers.isEmpty, true);
//   });
// }
