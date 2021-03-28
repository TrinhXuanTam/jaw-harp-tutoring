import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/user_not_signed_in_error.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';

@LazySingleton(env: [Environment.prod])
class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  Future<void> signOut() async {
    FacebookAuth.instance.logOut();
    GoogleSignIn().signOut();
    _auth.signOut();
  }

  Future<bool> isVerified() async {
    final user = _auth.currentUser;
    if (user == null) throw UserNotSignedInError();
    await user.reload();
    return _auth.currentUser!.emailVerified;
  }

  Future<void> sendVerificationEmail() async {
    final user = _auth.currentUser;
    if (user == null) throw UserNotSignedInError();
    return user.sendEmailVerification();
  }

  Future<UserDTO> linkAccountToEmail(String email, String password) async {
    final user = _auth.currentUser;
    if (user == null) throw UserNotSignedInError();
    final credentials = EmailAuthProvider.credential(email: email, password: password);
    await user.linkWithCredential(credentials);
    await _auth.signOut();
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    return UserDTO.fromFirebaseUser(_auth.currentUser!);
  }

  Future<UserDTO> linkAccountToFacebook() async {
    final user = _auth.currentUser;
    final accessToken = await FacebookAuth.instance.accessToken;
    if (user == null || accessToken == null) throw UserNotSignedInError();
    final credentials = FacebookAuthProvider.credential(accessToken.token);
    await user.linkWithCredential(credentials);
    await _auth.signOut();
    await _auth.signInWithCredential(credentials);
    return UserDTO.fromFirebaseUser(_auth.currentUser!);
  }

  Future<void> setLocale(String languageCode) async {
    _auth.setLanguageCode(languageCode);
  }
}
