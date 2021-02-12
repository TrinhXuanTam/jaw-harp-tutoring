import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/no_logged_user_error.dart';
import 'package:jews_harp/features/auth/data/data_source_interfaces/local/authentication_local.dart';
import 'package:jews_harp/features/auth/data/models/user_model.dart';

@prod
@LazySingleton(as: IAuthenticationLocalDataSource)
class FirebaseAuthLocal implements IAuthenticationLocalDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserModel> getCurrentUser() async {
    var user = _auth.currentUser;

    if (user == null) throw NoLoggedUserError();

    return UserModel(
      uid: user.uid,
      name: user.displayName,
      email: user.email,
    );
  }
}
