import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart' as Firebase;
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

  /// Create [FirebaseUserModel] from [FirebaseAuth.UserCredential]
  static Future<UserDTO> fromFirebaseCredentials(Firebase.UserCredential credentials) async {
    final user = credentials.user;
    if (user == null) throw UserDoesNotExistError();
    return UserDTO.fromFirebaseUser(user);
  }

  /// Create [FirebaseUserModel] from [Firebase.User]
  static Future<UserDTO> fromFirebaseUser(Firebase.User firebaseUser) async {
    final connectionAvailable = (await Connectivity().checkConnectivity()) != ConnectivityResult.none;

    // Default configuration if no internet connection is available.
    Set<String> roles = {USER_ROLE};
    Set<String> purchases = {};
    Set<String> favorites = {};

    // Load additional data if internet connection is available.
    if (connectionAvailable) {
      final snapshot = await FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).get();
      roles = Set<String>.from(snapshot["roles"]);
      purchases = Set<String>.from(snapshot["purchasedTechniques"]);
      favorites = Set<String>.from(snapshot["favoriteTechniques"]);
    }

    return UserDTO(
      uid: firebaseUser.uid,
      name: firebaseUser.displayName ?? "",
      email: firebaseUser.email!,
      isVerified: firebaseUser.emailVerified,
      roles: roles,
      purchasedTechniques: purchases,
      favoriteTechniques: favorites,
      profilePictureUrl: Optional.ofNullable(firebaseUser.photoURL),
    );
  }
}
