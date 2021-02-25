import 'package:firebase_auth/firebase_auth.dart' as Firebase;
import 'package:flutter/cupertino.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';

class UserDTO extends User {
  final String uid;
  final String name;
  final String email;

  const UserDTO({
    @required this.uid,
    @required this.name,
    @required this.email,
  });

  /// Create [FirebaseUserModel] from [FirebaseAuth.UserCredential]
  factory UserDTO.fromFirebaseCredentials(Firebase.UserCredential credentials) {
    return UserDTO.fromFirebaseUser(credentials.user);
  }

  /// Create [FirebaseUserModel] from [Firebase.User]
  factory UserDTO.fromFirebaseUser(Firebase.User firebaseUser) {
    return UserDTO(
      uid: firebaseUser.uid,
      name: firebaseUser.displayName,
      email: firebaseUser.email,
    );
  }
}
