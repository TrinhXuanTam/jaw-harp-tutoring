import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';

/// Send an account verification to a given [email].
@LazySingleton(env: [Environment.prod, Environment.dev, SEND_EMAIL_VERIFICATION_TEST_ENV])
class SendEmailVerification {
  final IUserAuthFacade _userAuthFacade;

  SendEmailVerification(this._userAuthFacade);

  Future<void> call() async => _userAuthFacade.sendVerificationEmail();
}
