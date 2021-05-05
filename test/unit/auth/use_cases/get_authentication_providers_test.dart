import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/auth_providers_id.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: IUserAuthRepository, env: [GET_AUTHENTICATION_PROVIDERS_TEST_ENV])
class UserAuthRepositoryMock extends Mock implements IUserAuthRepository {}

void main() {
  testConfigureDependencies(GET_AUTHENTICATION_PROVIDERS_TEST_ENV);

  final email = "john.doe@gmail.com";

  final providers = {
    FACEBOOK_PROVIDER,
    GOOGLE_PROVIDER,
    EMAIL_PROVIDER,
  };

  // Reset mock objects before each test.
  setUp(() {
    final userAuthRepository = serviceLocator<IUserAuthRepository>();
    reset(userAuthRepository);
  });

  test("[GetAuthProviders] should return set of authentication providers when user when user has multiple authentication providers", () async {
    final getAuthProviders = serviceLocator<GetAuthProviders>();
    final userAuthRepository = serviceLocator<IUserAuthRepository>();
    when(() => userAuthRepository.getAuthProviders(email)).thenAnswer((_) async => providers);

    final res = await getAuthProviders(email);

    expect(res, providers);
  });

  test("[GetAuthProviders] should return empty set when user when user doesn't exist", () async {
    final getAuthProviders = serviceLocator<GetAuthProviders>();
    final userAuthRepository = serviceLocator<IUserAuthRepository>();
    when(() => userAuthRepository.getAuthProviders(email)).thenAnswer((_) async => Set<String>());

    final res = await getAuthProviders(email);

    expect(res, Set<String>());
  });
}
