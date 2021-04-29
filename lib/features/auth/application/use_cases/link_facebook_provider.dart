import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';

/// Link currently signed in account to a Facebook profile.
@LazySingleton(env: [Environment.prod, Environment.dev, LINK_FACEBOOK_PROVIDER_TEST_ENV])
class LinkFacebookProvider {
  final IUserFacade _userFacade;

  LinkFacebookProvider(this._userFacade);

  Future<User> call() async => _userFacade.linkAccountToFacebook();
}
