import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/user_not_signed_in_error.dart';
import 'package:jews_harp/features/auth/data/data_source_interfaces/local/authentication_local.dart';
import 'package:jews_harp/features/auth/data/models/user_model.dart';

@LazySingleton(as: IAuthenticationLocalDataSource)
class FirebaseAuthLocal extends IAuthenticationLocalDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Check if user is signed in and return [UserModel], otherwise throw [UserNotSignedInError] exception.
  @override
  Future<UserModel> getCurrentUser() async {
    var user = _auth.currentUser;

    if (user == null) throw UserNotSignedInError();

    return UserModel(
      uid: user.uid,
      name: user.displayName,
      email: user.email,
    );
  }
}
