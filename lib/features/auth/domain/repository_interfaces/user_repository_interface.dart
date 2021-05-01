import 'package:jews_harp/features/auth/domain/entities/user.dart';

/// Repository to fetch and store authentication related data.
abstract class IUserAuthRepository {
  /// Get the currently signed in user.
  Future<User?> getCurrentUser();

  /// User data is cached locally.
  /// This function reloads the user data if called.
  Future<User> reloadUser();

  /// Get identity providers of given [email].
  Future<Set<String>> getAuthProviders(String email);
}
