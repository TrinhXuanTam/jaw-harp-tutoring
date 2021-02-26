import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';
import 'package:optional/optional.dart';

@LazySingleton(as: IUserFacade, env: [Environment.prod])
class FirebaseAuthFacade extends IUserFacade {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<bool> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  @override
  Future<void> signOut() async {
    _auth.signOut();
  }

  @override
  Future<bool> isVerified() async {
    await _auth.currentUser.reload();
    final user = _auth.currentUser;
    return user.emailVerified;
  }

  @override
  Future<void> sendVerificationEmail() {
    return _auth.currentUser.sendEmailVerification();
  }

  @override
  Future<UserDTO> linkAccountToEmail(String email, String password) async {
    final credentials = EmailAuthProvider.credential(email: email, password: password);
    await _auth.currentUser.linkWithCredential(credentials);
    _auth.signOut();
    _auth.signInWithEmailAndPassword(email: email, password: password);
    return UserDTO.fromFirebaseUser(_auth.currentUser);
  }

  @override
  Future<UserDTO> linkAccountToFacebook() async {
    final accessToken = await FacebookLogin().currentAccessToken;
    final credentials = FacebookAuthProvider.credential(accessToken.token);
    await _auth.currentUser.linkWithCredential(credentials);
    _auth.signOut();
    _auth.signInWithCredential(credentials);
    return UserDTO.fromFirebaseUser(_auth.currentUser);
  }
}
