import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/email_already_used_error.dart';
import 'package:jews_harp/core/errors/user_does_not_exist_error.dart';
import 'package:jews_harp/core/errors/wrong_email_or_password_error.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';
import 'package:optional/optional.dart';

@LazySingleton(env: [Environment.prod])
class FirebaseAuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference _users = FirebaseFirestore.instance.collection('users');

  var prevFacebookCredentials;

  void _addUserToFirestore(UserCredential credential) {
    final user = credential.user;
    final roles = ["user"];
    final purchasedTechniques = [];

    _users.doc(user.uid).set({
      "roles": FieldValue.arrayUnion(roles),
      "purchasedTechniques": FieldValue.arrayUnion(purchasedTechniques),
    });
  }

  /// Check if user is signed in and return [UserModel], otherwise throw [UserNotSignedInError] exception.
  Future<Optional<UserDTO>> getCurrentUser() async {
    final user = _auth.currentUser;

    // User not cached in the current device
    if (user == null) return Optional.empty();

    return Optional.of(UserDTO.fromFirebaseUser(user));
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

      // Add user to firestore
      _addUserToFirestore(credentials);

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
      final FacebookLogin facebookLogin = FacebookLogin();

      final res = await facebookLogin.logIn(["public_profile", "email"]);
      if (res.status == FacebookLoginStatus.loggedIn) {
        final FacebookAccessToken accessToken = res.accessToken;
        final AuthCredential facebookCredential = FacebookAuthProvider.credential(accessToken.token);
        final UserCredential firebaseCredential = await _auth.signInWithCredential(facebookCredential);

        if (firebaseCredential.additionalUserInfo.isNewUser) {
          firebaseCredential.user.sendEmailVerification();
          _addUserToFirestore(firebaseCredential);
        }

        return UserDTO.fromFirebaseCredentials(firebaseCredential);
      } else
        throw WrongEmailOrPasswordError();
    } on FirebaseAuthException catch (e) {
      throw EmailAlreadyUsedError(e.email);
    }
  }

  Future<UserDTO> authenticateWithGoogle() async {
    final GoogleSignIn googleLogin = GoogleSignIn(scopes: [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/userinfo.profile",
    ]);

    try {
      final GoogleSignInAccount googleSignInAccount = await googleLogin.signIn();

      if (googleSignInAccount == null) throw WrongEmailOrPasswordError();

      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential googleCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential firebaseCredential = await _auth.signInWithCredential(googleCredential);

      if (firebaseCredential.additionalUserInfo.isNewUser) {
        _addUserToFirestore(firebaseCredential);
      }

      return UserDTO.fromFirebaseCredentials(firebaseCredential);
    } on FirebaseAuthException catch (e) {
      throw EmailAlreadyUsedError(e.email);
    }
  }

  Future<List<String>> getUserRoles(String uid) async {
    final doc = await _users.doc(uid).get();

    if (doc == null) throw UserDoesNotExistError();

    return List.from(doc["roles"]);
  }
}