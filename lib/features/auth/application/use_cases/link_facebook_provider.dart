import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class LinkFacebookProvider {
  final IUserFacade _userFacade;

  LinkFacebookProvider(this._userFacade);

  Future<User> call() async => _userFacade.linkAccountToFacebook();
}
