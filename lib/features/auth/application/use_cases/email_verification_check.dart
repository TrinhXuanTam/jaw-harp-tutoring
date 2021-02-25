import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class EmailIsVerified {
  final IUserFacade _userFacade;

  EmailIsVerified(this._userFacade);

  Future<bool> call() async => _userFacade.isVerified();
}
