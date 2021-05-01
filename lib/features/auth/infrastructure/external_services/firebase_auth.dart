import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/user_not_signed_in_error.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';

/// Firebase Authentication service.
@LazySingleton(env: [Environment.prod])
class FirebaseAuthService {
  /// Firebase Authentication connection object.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Send password reset to given [email].
  Future<bool> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  /// Sign the user out from Firebase Authentication.
  Future<void> signOut() async {
    FacebookAuth.instance.logOut();
    GoogleSignIn().signOut();
    _auth.signOut();
  }

  /// Send account verification to given [email].
  Future<void> sendVerificationEmail() async {
    final user = _auth.currentUser;
    if (user == null) throw UserNotSignedInError();
    return user.sendEmailVerification();
  }

  /// Link an existing account to [email] and [password].
  Future<UserDTO> linkAccountToEmail(String email, String password) async {
    // Get the signed in account.
    final user = _auth.currentUser;
    if (user == null) throw UserNotSignedInError();

    // Create credentials from email and password.
    final credentials = EmailAuthProvider.credential(email: email, password: password);

    // Link accounts together.
    await user.linkWithCredential(credentials);

    // Sign in with new account.
    await _auth.signOut();
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    return UserDTO.fromFirebaseUser(_auth.currentUser!);
  }

  /// Link an existing account to Facebook profile.
  Future<UserDTO> linkAccountToFacebook() async {
    // Get the signed in account.
    final user = _auth.currentUser;

    // Get the access token from last Facebook login.
    final accessToken = await FacebookAuth.instance.accessToken;
    if (user == null || accessToken == null) throw UserNotSignedInError();
    final credentials = FacebookAuthProvider.credential(accessToken.token);

    // Link accounts together.
    await user.linkWithCredential(credentials);
    await _auth.signOut();

    // Sing in with Facebook account.
    await _auth.signInWithCredential(credentials);
    return UserDTO.fromFirebaseUser(_auth.currentUser!);
  }

  /// Set language for sending email.
  Future<void> setLocale(String languageCode) async {
    _auth.setLanguageCode(languageCode);
  }
}
