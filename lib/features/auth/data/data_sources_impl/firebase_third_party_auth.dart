import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/data/data_source_interfaces/remote/third_party_authentication.dart';
import 'package:jews_harp/features/auth/data/models/user_model.dart';

/// Firebase [IThirdPartyAuthenticationDataSource] implementation
@LazySingleton(as: IThirdPartyAuthenticationDataSource, env: [Environment.prod])
class FirebaseThirdPartyAuth extends IThirdPartyAuthenticationDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserModel> getUserWithFacebook() async {
    final facebookLogin = FacebookLogin();

    final res = await facebookLogin.logIn(["public_profile", "email"]);

    switch (res.status) {
      case FacebookLoginStatus.loggedIn:
        break;
      case FacebookLoginStatus.cancelledByUser:
      case FacebookLoginStatus.error:
        break;
    }
  }
}
