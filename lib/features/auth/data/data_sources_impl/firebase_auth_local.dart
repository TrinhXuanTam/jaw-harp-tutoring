import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/user_not_signed_in_error.dart';
import 'package:jews_harp/core/errors/user_not_verified_error.dart';
import 'package:jews_harp/features/auth/data/data_source_interfaces/local/authentication_local.dart';
import 'package:jews_harp/features/auth/data/models/user_model.dart';

/// Firebase [IAuthenticationLocalDataSource] implementation
@LazySingleton(as: IAuthenticationLocalDataSource, env: [Environment.prod])
class FirebaseAuthLocal extends IAuthenticationLocalDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Check if user is signed in and return [UserModel], otherwise throw [UserNotSignedInError] exception.
  @override
  Future<UserModel> getCurrentUser() async {
    final user = _auth.currentUser;

    // User not cached in the current device
    if (user == null) throw UserNotSignedInError();

    // User found but is not verified
    if (!user.emailVerified) {
      _auth.signOut();
      throw UserNotVerifiedError();
    }
    return UserModel.fromFirebaseUser(user);
  }
}
