import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/user_not_signed_in_error.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';

/// Firebase Authentication data source.
@LazySingleton(env: [Environment.prod])
class FirebaseAuthDataSource {
  /// Firebase Authentication connection object.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Check if user is signed in.
  /// Otherwise throw [UserNotSignedInError] exception.
  Future<UserDTO?> getCurrentUser() async {
    final user = _auth.currentUser;

    // User not cached in the current device.
    if (user == null) return null;

    return UserDTO.fromFirebaseUser(user);
  }

  /// Reload user data from Firebase Authentication.
  Future<UserDTO> reloadUser() async {
    final user = _auth.currentUser;
    if (user == null) throw UserNotSignedInError();

    // Refresh the user data.
    await user.reload();
    return UserDTO.fromFirebaseUser(_auth.currentUser!);
  }

  /// Get all auth providers of the given [email] .
  Future<Set<String>> getAuthProviders(String email) async {
    final list = await _auth.fetchSignInMethodsForEmail(email);
    return list.toSet();
  }
}
