import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';

/// Sign in with Google account.
@LazySingleton(env: [Environment.prod, Environment.dev, GOOGLE_AUTHENTICATION_TEST_ENV])
class GoogleAuthentication {
  final IUserAuthFacade _userAuthFacade;

  GoogleAuthentication(this._userAuthFacade);

  Future<User> call() async => _userAuthFacade.signInWithGoogle();
}
