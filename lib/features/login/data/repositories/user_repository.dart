import 'package:optional/optional_internal.dart';

import 'package:jews_harp/core/errors/no_logged_user_error.dart';

import 'package:jews_harp/features/login/domain/entities/user.dart';
import 'package:jews_harp/features/login/domain/repository_interfaces/user_repository_interface.dart';
import 'package:jews_harp/features/login/data/data_source_interfaces/local/authentication_local.dart';
import 'package:jews_harp/features/login/data/data_source_interfaces/remote/authentication_remote.dart';

class UserRepository implements IUserRepository {
  final IAuthenticationRemoteDataSource _remoteAuth;
  final IAuthenticationLocalDataSource _localAuth;

  UserRepository(this._remoteAuth, this._localAuth);

  @override
  Future<bool> userIsAdmin(User user) async {
    return Future.value(false);
  }

  @override
  Future<Optional<User>> getCurrentUser() async {
    try {
      final currentUser = await _localAuth.getCurrentUser();
      return Optional.of(currentUser);
    } on NoLoggedUserError {
      return Optional.empty();
    }
  }
}
