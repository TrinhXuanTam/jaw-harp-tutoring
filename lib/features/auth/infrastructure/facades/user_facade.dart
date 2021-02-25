import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';

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

    // trust Facebook auth provider
    if (user.providerData[0].providerId == "facebook.com") return true;

    // trust Google auth provider
    if (user.providerData[0].providerId == "google.com") return true;

    return user.emailVerified;
  }

  @override
  Future<void> sendVerificationEmail() {
    return _auth.currentUser.sendEmailVerification();
  }
}
