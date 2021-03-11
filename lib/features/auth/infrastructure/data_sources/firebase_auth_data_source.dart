import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/settings.dart';
import 'package:jews_harp/core/errors/email_already_used_error.dart';
import 'package:jews_harp/core/errors/third_party_auth_error.dart';
import 'package:jews_harp/core/errors/user_does_not_exist_error.dart';
import 'package:jews_harp/core/errors/user_not_signed_in_error.dart';
import 'package:jews_harp/core/errors/wrong_email_or_password_error.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';

@LazySingleton(env: [Environment.prod])
class FirebaseAuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference _users = FirebaseFirestore.instance.collection('users');

  void _addUserToFirestore(User user) {
    _users.doc(user.uid).set({
      "roles": FieldValue.arrayUnion([USER_ROLE]),
      "purchasedTechniques": FieldValue.arrayUnion([]),
    });
  }

  /// Check if user is signed in and return [UserModel], otherwise throw [UserNotSignedInError] exception.
  Future<UserDTO?> getCurrentUser() async {
    final user = _auth.currentUser;

    // User not cached in the current device
    if (user == null) return null;

    return UserDTO.fromFirebaseUser(user);
  }

  /// Sign in with email and password
  Future<UserDTO> signInWithEmail(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);

      return UserDTO.fromFirebaseCredentials(userCredential);
    } on FirebaseAuthException {
      throw WrongEmailOrPasswordError();
    }
  }

  /// Sign up with email and password
  Future<UserDTO> signUpWithEmail(String name, String email, String password) async {
    try {
      final credentials = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      final user = credentials.user;

      if (user == null) throw UserDoesNotExistError();

      // Add user to firestore
      _addUserToFirestore(user);

      // Save full name
      user.updateProfile(displayName: name);

      // Send email verification
      user.sendEmailVerification();

      return UserDTO.fromFirebaseUser(user);
    } on FirebaseAuthException {
      throw EmailAlreadyUsedError(email);
    }
  }

  Future<bool> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  Future<Set<String>> getAuthProviders(String email) async {
    final list = await _auth.fetchSignInMethodsForEmail(email);
    return list.toSet();
  }

  Future<UserDTO> authenticateWithFacebook() async {
    try {
      final accessToken = await FacebookAuth.instance.login();

      if (accessToken == null) throw UserNotSignedInError();

      final AuthCredential facebookCredential = FacebookAuthProvider.credential(accessToken.token!);
      final UserCredential firebaseCredential = await _auth.signInWithCredential(facebookCredential);

      if (firebaseCredential.additionalUserInfo!.isNewUser) {
        final user = firebaseCredential.user!;
        user.sendEmailVerification();
        _addUserToFirestore(user);
      }

      return UserDTO.fromFirebaseCredentials(firebaseCredential);
    } on FirebaseAuthException catch (e) {
      throw EmailAlreadyUsedError(e.email!);
    } on FacebookAuthException catch (e) {
      throw ThirdPartyAuthError(e.errorCode);
    }
  }

  Future<UserDTO> authenticateWithGoogle() async {
    final GoogleSignIn googleLogin = GoogleSignIn(scopes: [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/userinfo.profile",
    ]);

    try {
      final GoogleSignInAccount? googleSignInAccount = await googleLogin.signIn();

      if (googleSignInAccount == null) throw WrongEmailOrPasswordError();

      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential googleCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential firebaseCredential = await _auth.signInWithCredential(googleCredential);

      if (firebaseCredential.additionalUserInfo!.isNewUser) {
        _addUserToFirestore(firebaseCredential.user!);
      }

      return UserDTO.fromFirebaseCredentials(firebaseCredential);
    } on FirebaseAuthException catch (e) {
      throw EmailAlreadyUsedError(e.email!);
    }
  }

  Future<void> setLocale(String languageCode) async {
    _auth.setLanguageCode(languageCode);
  }
}
