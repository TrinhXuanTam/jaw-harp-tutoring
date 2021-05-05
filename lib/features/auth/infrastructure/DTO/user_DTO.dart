import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart' as Firebase;
import 'package:flutter/cupertino.dart';
import 'package:jews_harp/core/constants/settings.dart';
import 'package:jews_harp/core/errors/user_does_not_exist_error.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:optional/optional.dart';

/// User data transfer object.
/// The DTO is used to convert Firebase Authentication data.
class UserDTO extends User {
  const UserDTO({
    required String uid,
    required String name,
    required String email,
    required bool isVerified,
    Set<String> roles = const {},
    Set<String> purchasedTechniques = const {},
    Set<String> favoriteTechniques = const {},
    Optional<String> profilePictureUrl = const Optional.empty(),
  }) : super(
          uid: uid,
          name: name,
          email: email,
          isVerified: isVerified,
          roles: roles,
          purchasedTechniques: purchasedTechniques,
          favoriteTechniques: favoriteTechniques,
          profilePictureUrl: profilePictureUrl,
        );

  /// Create [FirebaseUserModel] from [Firebase.User]
  factory UserDTO.fromFirebaseUser(Firebase.User firebaseUser, {DocumentSnapshot? userDoc}) {
    return UserDTO(
      uid: firebaseUser.uid,
      name: firebaseUser.displayName ?? "",
      email: firebaseUser.email!,
      isVerified: firebaseUser.emailVerified,
      roles: userDoc != null ? Set<String>.from(userDoc["roles"]) : {USER_ROLE},
      purchasedTechniques: userDoc != null ? Set<String>.from(userDoc["purchasedTechniques"]) : {},
      favoriteTechniques: userDoc != null ? Set<String>.from(userDoc["favoriteTechniques"]) : {},
      profilePictureUrl: Optional.ofNullable(firebaseUser.photoURL),
    );
  }
}
