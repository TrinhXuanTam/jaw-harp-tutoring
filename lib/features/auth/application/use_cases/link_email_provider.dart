import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class LinkEmailProvider {
  final IUserFacade _userFacade;

  LinkEmailProvider(this._userFacade);

  Future<User> call(String email, String password) async => _userFacade.linkAccountToEmail(email, password);
}
