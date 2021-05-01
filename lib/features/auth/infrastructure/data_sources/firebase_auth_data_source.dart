import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/settings.dart';
import 'package:jews_harp/core/errors/email_already_used_error.dart';
import 'package:jews_harp/core/errors/user_not_signed_in_error.dart';
import 'package:jews_harp/core/errors/wrong_email_or_password_error.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';

/// Firebase Authentication data source.
@LazySingleton(env: [Environment.prod])
class FirebaseAuthDataSource {
  /// Firebase Authentication connection object.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// User collection.
  CollectionReference _users = FirebaseFirestore.instance.collection('users');

  /// Add a new user document to Firestore.
  void _addUserToFirestore(User user) {
    _users.doc(user.uid).set({
      // USER_ROLE is added by default.
      "roles": FieldValue.arrayUnion([USER_ROLE]),
      "favoriteTechniques": [],
      "purchasedTechniques": [],
    });
  }

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

  /// Sign in with [email] and [password].
  /// Throw [WrongEmailOrPasswordError] if authentication fails.
  Future<UserDTO> signInWithEmail(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return UserDTO.fromFirebaseCredentials(userCredential);
    } on FirebaseAuthException {
      throw WrongEmailOrPasswordError();
    }
  }

  /// Sign up with [email] and [password] then set [name].
  /// Throw [EmailAlreadyUsedError] if email is already in use.
  Future<UserDTO> signUpWithEmail(String name, String email, String password) async {
    try {
      final credentials = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      final user = credentials.user!;

      // Add user to firestore.
      _addUserToFirestore(user);

      // Save full name.
      user.updateProfile(displayName: name);

      // Send email verification.
      user.sendEmailVerification();

      return UserDTO.fromFirebaseUser(user);
    } on FirebaseAuthException {
      throw EmailAlreadyUsedError(email);
    }
  }

  /// Send password reset to given [email].
  Future<bool> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  /// Get all auth providers of the given [email] .
  Future<Set<String>> getAuthProviders(String email) async {
    final list = await _auth.fetchSignInMethodsForEmail(email);
    return list.toSet();
  }

  /// Authenticate with Facebook account and create new account if it doesn't exist.
  /// Throws [EmailAlreadyUsedError] when creating new account with a used email.
  Future<UserDTO> authenticateWithFacebook() async {
    try {
      // Redirect to Facebook page and log in.
      final loginResult = await FacebookAuth.instance.login();

      // Login has failed.
      if (loginResult.status == LoginStatus.failed || loginResult.accessToken == null) throw UserNotSignedInError();

      // Sign in to Firebase with Facebook credentials.
      final accessToken = loginResult.accessToken!.token;
      final AuthCredential facebookCredential = FacebookAuthProvider.credential(accessToken);
      final UserCredential firebaseCredential = await _auth.signInWithCredential(facebookCredential);

      // Send verification email and create new Firestore document if user is new.
      if (firebaseCredential.additionalUserInfo!.isNewUser) {
        final user = firebaseCredential.user!;
        user.sendEmailVerification();
        _addUserToFirestore(user);
      }

      // Update profile photo in Firebase Authentication.
      final user = firebaseCredential.user!;
      if (user.photoURL != null) {
        String photoUrl = user.photoURL! + "?height=500&access_token=" + accessToken;
        await user.updateProfile(photoURL: photoUrl);
      }

      return UserDTO.fromFirebaseCredentials(firebaseCredential);
    } on FirebaseAuthException catch (e) {
      throw EmailAlreadyUsedError(e.email!);
    }
  }

  /// Authenticate with Google account and create new account if it doesn't exist.
  /// Throws [EmailAlreadyUsedError] when creating new account with a used email.
  Future<UserDTO> authenticateWithGoogle() async {
    try {
      // Initialize google sign in object.
      final GoogleSignIn googleLogin = GoogleSignIn(scopes: [
        "https://www.googleapis.com/auth/userinfo.email",
        "https://www.googleapis.com/auth/userinfo.profile",
      ]);

      // Redirect to Google sign in page.
      final GoogleSignInAccount? googleSignInAccount = await googleLogin.signIn();

      // Login has failed.
      if (googleSignInAccount == null) throw UserNotSignedInError();

      // Get credentials from google account.
      final googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential googleCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      // Sign in to Firebase with google credentials.
      final UserCredential firebaseCredential = await _auth.signInWithCredential(googleCredential);

      // Create new Firestore document if user is new.
      // Google is a trusted provider, therefore no verification is needed.
      if (firebaseCredential.additionalUserInfo!.isNewUser) {
        _addUserToFirestore(firebaseCredential.user!);
      }

      return UserDTO.fromFirebaseCredentials(firebaseCredential);
    } on FirebaseAuthException catch (e) {
      throw EmailAlreadyUsedError(e.email!);
    }
  }

  /// Set language for sending email.
  Future<void> setLocale(String languageCode) async {
    _auth.setLanguageCode(languageCode);
  }
}
