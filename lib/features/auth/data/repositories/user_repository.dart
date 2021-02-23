import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants.dart';
import 'package:jews_harp/features/auth/data/data_source_interfaces/remote/authentication_remote.dart';
import 'package:jews_harp/features/auth/data/data_source_interfaces/remote/third_party_authentication.dart';
import 'package:optional/optional_internal.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:jews_harp/features/auth/data/data_source_interfaces/local/authentication_local.dart';

@LazySingleton(as: IUserRepository, env: [Environment.prod, USER_REPOSITORY_TEST_ENV])
class UserRepository extends IUserRepository {
  final IAuthenticationRemoteDataSource _remoteAuth;
  final IAuthenticationLocalDataSource _localAuth;
  final IThirdPartyAuthenticationDataSource _thirdPartyAuth;

  UserRepository(this._remoteAuth, this._localAuth, this._thirdPartyAuth);

  @override
  Future<bool> userIsAdmin(User user) async {
    // TODO
    return false;
  }

  @override
  Future<Optional<User>> getCurrentUser() {
    return _localAuth.getCurrentUser();
  }

  @override
  Future<Optional<User>> getUserWithEmailAndPassword(String email, String password) {
    return _remoteAuth.getUser(email, password);
  }

  @override
  Future<Optional<User>> createUser(String name, String email, String password) {
    return _remoteAuth.createNewUser(name, email, password);
  }

  @override
  Future<Optional<User>> getUserWithFacebook() {
    return _thirdPartyAuth.getUserWithFacebook();
  }
}
