import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart';

@LazySingleton(as: IUserAuthRepository, env: [Environment.prod, USER_REPOSITORY_TEST_ENV])
class UserAuthRepository extends IUserAuthRepository {
  final FirebaseAuthDataSource _firebaseAuthDataSource;

  UserAuthRepository(this._firebaseAuthDataSource);

  @override
  Future<User> createUser(String name, String email, String password) => _firebaseAuthDataSource.signUpWithEmail(name, email, password);

  @override
  Future<User?> getCurrentUser() => _firebaseAuthDataSource.getCurrentUser();

  @override
  Future<User> getUserWithEmailAndPassword(String email, String password) => _firebaseAuthDataSource.signInWithEmail(email, password);

  @override
  Future<User> getUserWithFacebook() => _firebaseAuthDataSource.authenticateWithFacebook();

  @override
  Future<User> getUserWithGoogle() => _firebaseAuthDataSource.authenticateWithGoogle();

  @override
  Future<Set<String>> getAuthProviders(String email) => _firebaseAuthDataSource.getAuthProviders(email);

  @override
  Future<void> setLocale(String languageCode) => _firebaseAuthDataSource.setLocale(languageCode);
}
