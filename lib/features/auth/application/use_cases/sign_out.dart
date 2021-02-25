import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class SignOut {
  final IUserFacade _userFacade;

  SignOut(this._userFacade);

  Future<void> call() async => _userFacade.signOut();
}
