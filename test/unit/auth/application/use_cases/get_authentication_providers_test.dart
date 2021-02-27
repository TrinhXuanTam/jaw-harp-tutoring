import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/core/constants/auth_providers_id.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:mockito/mockito.dart';

import '../../../../dependency_injection/test_service_locator.dart';

void main() {
  testConfigureDependencies(GET_AUTHENTICATION_PROVIDERS_TEST_ENV);
  final getAuthProviders = serviceLocator<GetAuthProviders>();
  final email = "john.doe@gmail.com";

  test("[GetAuthProviders] should return set of authentication providers when user when user has multiple authentication providers", () async {
    when(testServiceLocator<IUserRepository>().getAuthProviders(email)).thenAnswer(
      (_) async => Set<String>.of([FACEBOOK_PROVIDER, GOOGLE_PROVIDER, EMAIL_PROVIDER]),
    );

    final providers = await getAuthProviders(email);
    assert(providers.isNotEmpty);
    assert(providers.contains(FACEBOOK_PROVIDER));
    assert(providers.contains(GOOGLE_PROVIDER));
    assert(providers.contains(EMAIL_PROVIDER));
  });

  test("[GetAuthProviders] should return empty set when user when user doesn't exist", () async {
    when(testServiceLocator<IUserRepository>().getAuthProviders(email)).thenAnswer(
      (_) async => Set(),
    );

    final providers = await getAuthProviders(email);
    assert(providers.isEmpty);
  });
}
