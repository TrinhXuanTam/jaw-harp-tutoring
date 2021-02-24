import 'package:firebase_auth/firebase_auth.dart' as Firebase;
import 'package:flutter/foundation.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';

class UserModel extends User {
  final Firebase.FirebaseAuth _auth = Firebase.FirebaseAuth.instance;

  UserModel({
    @required uid,
    @required name,
    @required email,
  }) : super(uid: uid, name: name, email: email);

  /// Create [FirebaseUserModel] from [FirebaseAuth.UserCredential]
  factory UserModel.fromFirebaseCredentials(Firebase.UserCredential credentials) {
    return UserModel.fromFirebaseUser(credentials.user);
  }

  /// Create [FirebaseUserModel] from [Firebase.User]
  factory UserModel.fromFirebaseUser(Firebase.User firebaseUser) {
    return UserModel(
      uid: firebaseUser.uid,
      name: firebaseUser.displayName,
      email: firebaseUser.email,
    );
  }

  /// Check if user email is verified
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

  /// Send a new verification email
  @override
  Future<void> sendVerificationEmail() {
    return _auth.currentUser.sendEmailVerification();
  }

  /// Sign out the user
  @override
  Future<void> signOut() {
    return _auth.signOut();
  }
}
