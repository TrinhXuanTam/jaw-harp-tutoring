import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';

/// User facade to handle authentication related logic.
abstract class IUserAuthFacade {
  /// Create a new user with email and password.
  Future<User> signUpWithEmailAndPassword(String name, String email, String password);

  /// Send account confirmation email.
  Future<void> sendVerificationEmail();

  /// Sign the user in with email and password.
  Future<User> signInWithEmailAndPassword(String email, String password);

  /// Sign the user with Facebook Profile.
  Future<User> signInWithFacebook();

  /// Sign the user with Google account.
  Future<User> signInWithGoogle();

  /// Sign the currently logged in user out.
  Future<void> signOut();

  /// Send password reset email.
  Future<bool> resetPassword(String email);

  /// Link currently signed in account to email and password.
  Future<UserDTO> linkAccountToEmail(String email, String password);

  /// Link currently signed in account to Facebook profile.
  Future<UserDTO> linkAccountToFacebook();

  /// Set language for sending emails.
  Future<void> setLocale(String languageCode);
}
