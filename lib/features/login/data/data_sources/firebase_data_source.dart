import 'package:firebase_auth/firebase_auth.dart';
import 'package:jews_harp/core/errors/no_logged_user_error.dart';
import 'package:jews_harp/features/login/data/data_source_interfaces/local/authentication_local.dart';
import 'package:jews_harp/features/login/data/data_source_interfaces/remote/authentication_remote.dart';
import 'package:jews_harp/features/login/data/models/user_model.dart';

class FirebaseDataSource implements IAuthenticationRemoteDataSource, IAuthenticationLocalDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserModel> getCurrentUser() async {
    var user =  _auth.currentUser;

    if (user == null) throw NoLoggedUserError();

    return UserModel(
      uid: user.uid,
      name: user.displayName,
      email: user.email,
    );
  }
}
