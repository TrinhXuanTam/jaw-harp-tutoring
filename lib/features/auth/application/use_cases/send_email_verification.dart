import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class SendEmailVerification {
  final IUserFacade _userFacade;

  SendEmailVerification(this._userFacade);

  Future<void> call() async => _userFacade.sendVerificationEmail();
}