import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart';

/// User authentication repository.
@LazySingleton(as: IUserAuthRepository, env: [Environment.prod, USER_AUTH_REPOSITORY_TEST_ENV])
class UserAuthRepository extends IUserAuthRepository {
  /// Firebase Authentication data source.
  final FirebaseAuthDataSource _firebaseAuthDataSource;

  UserAuthRepository(this._firebaseAuthDataSource);

  @override
  Future<User?> getCurrentUser(bool connectionAvailable) => _firebaseAuthDataSource.getCurrentUser(connectionAvailable);

  @override
  Future<User> reloadUser() => _firebaseAuthDataSource.reloadUser();

  @override
  Future<Set<String>> getAuthProviders(String email) => _firebaseAuthDataSource.getAuthProviders(email);
}
