import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/settings.dart';
import 'package:jews_harp/core/errors/email_already_used_error.dart';
import 'package:jews_harp/core/errors/email_not_found_error.dart';
import 'package:jews_harp/core/errors/user_not_signed_in_error.dart';
import 'package:jews_harp/core/errors/wrong_email_or_password_error.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';

/// Firebase Authentication service.
@LazySingleton(env: [Environment.prod])
class FirebaseAuthService {
  /// Firebase Authentication connection object.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// User collection.
  final CollectionReference _users = FirebaseFirestore.instance.collection('users');

  /// Add a new user document to Firestore.
  void _addUserToFirestore(User user) {
    _users.doc(user.uid).set({
      // USER_ROLE is added by default.
      "roles": FieldValue.arrayUnion([USER_ROLE]),
      "favoriteTechniques": [],
      "purchasedTechniques": [],
    });
  }

  /// Load user with firestore data.
  Future<UserDTO> _loadUserWithFirebaseData(User user) async {
    final firestore = FirebaseFirestore.instance;
    final userCollection = firestore.collection('users');
    final userDoc = await userCollection.doc(user.uid).get();

    return UserDTO.fromFirebaseUser(user, userDoc: userDoc);
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

      return _loadUserWithFirebaseData(user);
    } on FirebaseAuthException {
      throw EmailAlreadyUsedError(email);
    }
  }

  /// Send account verification to given [email].
  Future<void> sendVerificationEmail() async {
    final user = _auth.currentUser;
    if (user == null) throw UserNotSignedInError();
    return user.sendEmailVerification();
  }

  /// Sign in with [email] and [password].
  /// Throw [WrongEmailOrPasswordError] if authentication fails.
  Future<UserDTO> signInWithEmail(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return _loadUserWithFirebaseData(userCredential.user!);
    } on FirebaseAuthException {
      throw WrongEmailOrPasswordError();
    }
  }

  /// Authenticate with Facebook account and create new account if it doesn't exist.
  /// Throws [EmailAlreadyUsedError] when creating new account with a used email.
  Future<UserDTO> signInWithFacebook() async {
    try {
      // Redirect to Facebook page and log in.
      final loginResult = await FacebookAuth.instance.login();

      // Login has failed.
      if (loginResult.status == LoginStatus.failed || loginResult.accessToken == null) throw UserNotSignedInError();

      // Sign in to Firebase with Facebook credentials.
      final accessToken = loginResult.accessToken!;
      final AuthCredential facebookCredential = FacebookAuthProvider.credential(accessToken.token);
      final UserCredential firebaseCredential = await _auth.signInWithCredential(facebookCredential);

      // Send verification email and create new Firestore document if user is new.
      if (firebaseCredential.additionalUserInfo!.isNewUser) {
        final user = firebaseCredential.user!;
        user.updateProfile(photoURL: "https://graph.facebook.com/${accessToken.userId}/picture?width=500&access_token=${accessToken.token}");
        user.sendEmailVerification();
        _addUserToFirestore(user);
      }

      return _loadUserWithFirebaseData(firebaseCredential.user!);
    } on FirebaseAuthException catch (e) {
      throw EmailAlreadyUsedError(e.email!);
    }
  }

  /// Authenticate with Google account and create new account if it doesn't exist.
  /// Throws [EmailAlreadyUsedError] when creating new account with a used email.
  Future<UserDTO> signInWithGoogle() async {
    try {
      // Initialize google sign in object.
      final GoogleSignIn googleLogin = GoogleSignIn(scopes: [
        "https://www.googleapis.com/_auth/userinfo.email",
        "https://www.googleapis.com/_auth/userinfo.profile",
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

      return _loadUserWithFirebaseData(firebaseCredential.user!);
    } on FirebaseAuthException catch (e) {
      throw EmailAlreadyUsedError(e.email!);
    }
  }

  /// Sign the user out from Firebase Authentication.
  Future<void> signOut() async {
    FacebookAuth.instance.logOut();
    GoogleSignIn().signOut();
    _auth.signOut();
  }

  /// Send password reset to given [email].
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException {
      throw EmailNotFoundError();
    }
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
    return _loadUserWithFirebaseData(_auth.currentUser!);
  }

  /// Link an existing account to Facebook profile.
  Future<UserDTO> linkAccountToFacebook() async {
    // Get the signed in account.
    final user = _auth.currentUser;
    if (user == null) throw UserNotSignedInError();

    // Get the access token from last Facebook login.
    final accessToken = await FacebookAuth.instance.accessToken;
    if (accessToken == null) throw UserNotSignedInError();
    final credentials = FacebookAuthProvider.credential(accessToken.token);

    // Link accounts together.
    await user.linkWithCredential(credentials);
    await _auth.signOut();

    // Sing in with Facebook account.
    await _auth.signInWithCredential(credentials);
    final fbUser = _auth.currentUser!;

    // Update profile picture.
    await fbUser.updateProfile(photoURL: "https://graph.facebook.com/${accessToken.userId}/picture?width=500&access_token=${accessToken.token}");

    return _loadUserWithFirebaseData(fbUser);
  }

  /// Set language for sending email.
  Future<void> setLocale(String languageCode) async {
    _auth.setLanguageCode(languageCode);
  }
}
