import 'package:injectable/injectable.dart';
import 'package:optional/optional_internal.dart';

import 'package:jews_harp/core/errors/user_not_signed_in_error.dart';

import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:jews_harp/features/auth/data/data_source_interfaces/local/authentication_local.dart';
import 'package:jews_harp/features/auth/data/data_source_interfaces/remote/authentication_remote.dart';

@LazySingleton(as: IUserRepository)
class UserRepository extends IUserRepository {
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
    } on UserNotSignedInError {
      return Optional.empty();
    }
  }
}
