import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';

@LazySingleton(env: [Environment.prod, Environment.dev, SEND_EMAIL_VERIFICATION_TEST_ENV])
class SendEmailVerification {
  final IUserFacade _userFacade;

  SendEmailVerification(this._userFacade);

  Future<void> call() async => _userFacade.sendVerificationEmail();
}
