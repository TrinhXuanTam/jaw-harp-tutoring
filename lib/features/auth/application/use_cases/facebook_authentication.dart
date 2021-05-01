import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';

/// Authenticate with Facebook.
@LazySingleton(env: [Environment.prod, Environment.dev, FACEBOOK_AUTHENTICATION_TEST_ENV])
class FacebookAuthentication {
  final IUserAuthFacade _userAuthFacade;

  FacebookAuthentication(this._userAuthFacade);

  Future<User> call() async => _userAuthFacade.signInWithFacebook();
}
