import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';

/// Sign out the current user.
@LazySingleton(env: [Environment.prod, Environment.dev, SIGN_OUT_TEST_ENV])
class SignOut {
  final IUserAuthFacade _userAuthFacade;

  SignOut(this._userAuthFacade);

  Future<void> call() async => _userAuthFacade.signOut();
}
