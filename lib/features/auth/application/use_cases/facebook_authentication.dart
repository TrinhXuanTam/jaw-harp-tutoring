import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';

/// Authenticate with Facebook.
@LazySingleton(env: [Environment.prod, Environment.dev, FACEBOOK_AUTHENTICATION_TEST_ENV])
class FacebookAuthentication {
  final IUserAuthRepository _userRepository;

  FacebookAuthentication(this._userRepository);

  Future<User> call() async => _userRepository.getUserWithFacebook();
}
