import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart';
import 'package:optional/optional_internal.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';

@LazySingleton(as: IUserRepository, env: [Environment.prod, USER_REPOSITORY_TEST_ENV])
class UserRepository extends IUserRepository {
  final FirebaseAuthDataSource _firebaseAuthDataSource;

  UserRepository(this._firebaseAuthDataSource);

  @override
  Future<Optional<User>> createUser(String name, String email, String password) {
    return _firebaseAuthDataSource.signUpWithEmail(name, email, password);
  }

  @override
  Future<Optional<User>> getCurrentUser() {
    return _firebaseAuthDataSource.getCurrentUser();
  }

  @override
  Future<Optional<User>> getUserWithEmailAndPassword(String email, String password) {
    return _firebaseAuthDataSource.signInWithEmail(email, password);
  }

  @override
  Future<Optional<User>> getUserWithFacebook() {
    return _firebaseAuthDataSource.signUpWithFacebook();
  }

  @override
  Future<Optional<User>> getUserWithGoogle() {
    return _firebaseAuthDataSource.signUpWithGoogle();
  }

  @override
  Future<Set<String>> getAuthProviders(String email) {
    return _firebaseAuthDataSource.getAuthProviders(email);
  }
}
