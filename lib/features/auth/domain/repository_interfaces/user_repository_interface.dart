import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:optional/optional_internal.dart';

abstract class IUserRepository {
  Future<bool> userIsAdmin(User user);

  /// Get signed in user
  Future<Optional<User>> getCurrentUser();

  /// Sign user in with email and password
  Future<Optional<User>> getUserWithEmailAndPassword(String email, String password);

  /// Sign user in with Facebook account
  Future<Optional<User>> getUserWithFacebook();

  /// Sign up user
  Future<Optional<User>> createUser(String name, String email, String password);
}
