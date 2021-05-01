import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';

/// Get all auth providers for a given [email].
@LazySingleton(env: [Environment.prod, Environment.dev, GET_AUTHENTICATION_PROVIDERS_TEST_ENV])
class GetAuthProviders {
  final IUserAuthRepository _userRepository;

  GetAuthProviders(this._userRepository);

  Future<Set<String>> call(String email) => _userRepository.getAuthProviders(email);
}
