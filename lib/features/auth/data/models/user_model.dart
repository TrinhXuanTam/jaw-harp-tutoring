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
  factory UserModel.fromFirebaseCredentials(
      Firebase.UserCredential credentials) {
    return UserModel.fromFirebaseUser(credentials.user);
  }

  /// Create [FirebaseUserModel] from [Firebase.User]
  factory UserModel.fromFirebaseUser(Firebase.User firebaseUser) {
    firebaseUser.reload();
    return UserModel(
      uid: firebaseUser.uid,
      name: firebaseUser.displayName,
      email: firebaseUser.email,
    );
  }

  @override
  Future<bool> isVerified() {
    return Future.value(_auth.currentUser.emailVerified);
  }

  @override
  Future<void> sendVerificationEmail() {
    return _auth.currentUser.sendEmailVerification();
  }

  @override
  Future<void> signOut() {
    return _auth.signOut();
  }
}
