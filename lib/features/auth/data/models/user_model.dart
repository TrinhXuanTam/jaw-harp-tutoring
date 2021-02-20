import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:flutter/foundation.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    @required uid,
    @required name,
    @required email,
  }) : super(uid: uid, name: name, email: email);

  /// Create [UserModel] from [FirebaseAuth.UserCredential]
  factory UserModel.fromFirebaseCredentials(
      FirebaseAuth.UserCredential credentials) {
    return UserModel.fromFirebaseUser(credentials.user);
  }

  /// Create [UserModel] from [FirebaseAuth.User]
  factory UserModel.fromFirebaseUser(FirebaseAuth.User firebaseUser) {
    return UserModel(
      uid: firebaseUser.uid,
      name: firebaseUser.displayName,
      email: firebaseUser.email,
    );
  }
}
