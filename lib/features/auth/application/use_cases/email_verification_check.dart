import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';

/// Check if email is verified.
@LazySingleton(env: [Environment.prod, Environment.dev, EMAIL_VERIFICATION_CHECK_TEST_ENV])
class EmailIsVerified {
  final IUserFacade _userFacade;

  EmailIsVerified(this._userFacade);

  Future<bool> call() async => _userFacade.isVerified();
}
