import 'package:jews_harp/features/auth/domain/entities/user.dart';

abstract class IUserRepository {
  /// Sign up user
  Future<User> createUser(String name, String email, String password);

  /// Get signed in user
  Future<User?> getCurrentUser();

  /// Sign user in with email and password
  Future<User> getUserWithEmailAndPassword(String email, String password);

  /// Sign user in with Facebook account
  Future<User> getUserWithFacebook();

  /// Sign user in with Google account
  Future<User> getUserWithGoogle();

  /// Get authentication providers for email
  Future<Set<String>> getAuthProviders(String email);

  /// User roles
  Future<List<String>> getUserRoles(User user);

  Future<void> setLocale(String languageCode);
}
