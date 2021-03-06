import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/user_not_signed_in_error.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';

@LazySingleton(as: IUserFacade, env: [Environment.prod])
class FirebaseAuthFacade extends IUserFacade {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<bool> resetPassword(String email, {String languageCode = "en"}) async {
    try {
      await _auth.setLanguageCode(languageCode);
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  @override
  Future<void> signOut() async {
    FacebookAuth.instance.logOut();
    GoogleSignIn().signOut();
    _auth.signOut();
  }

  @override
  Future<bool> isVerified() async {
    final user = _auth.currentUser;
    if (user == null) throw UserNotSignedInError();
    await user.reload();
    return _auth.currentUser!.emailVerified;
  }

  @override
  Future<void> sendVerificationEmail({String languageCode = "en"}) async {
    final user = _auth.currentUser;
    if (user == null) throw UserNotSignedInError();
    await _auth.setLanguageCode(languageCode);
    return user.sendEmailVerification();
  }

  @override
  Future<UserDTO> linkAccountToEmail(String email, String password) async {
    final user = _auth.currentUser;
    if (user == null) throw UserNotSignedInError();
    final credentials = EmailAuthProvider.credential(email: email, password: password);
    await user.linkWithCredential(credentials);
    await _auth.signOut();
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    return UserDTO.fromFirebaseUser(_auth.currentUser!);
  }

  @override
  Future<UserDTO> linkAccountToFacebook() async {
    final user = _auth.currentUser;
    final accessToken = await FacebookAuth.instance.accessToken;
    if (user == null || accessToken == null) throw UserNotSignedInError();
    final credentials = FacebookAuthProvider.credential(accessToken.token!);
    await user.linkWithCredential(credentials);
    await _auth.signOut();
    await _auth.signInWithCredential(credentials);
    return UserDTO.fromFirebaseUser(_auth.currentUser!);
  }
}
