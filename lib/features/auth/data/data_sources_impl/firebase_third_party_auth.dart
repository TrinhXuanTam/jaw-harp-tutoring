import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/data/data_source_interfaces/remote/third_party_authentication.dart';
import 'package:jews_harp/features/auth/data/models/user_model.dart';
import 'package:optional/optional.dart';

/// Firebase [IThirdPartyAuthenticationDataSource] implementation
@LazySingleton(as: IThirdPartyAuthenticationDataSource, env: [Environment.prod])
class FirebaseThirdPartyAuth extends IThirdPartyAuthenticationDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<Optional<UserModel>> getUserWithFacebook() async {
    final facebookLogin = FacebookLogin();

    final res = await facebookLogin.logIn(["public_profile", "email"]);

    if (res.status == FacebookLoginStatus.loggedIn) {
      final FacebookAccessToken accessToken = res.accessToken;
      final AuthCredential facebookCredential = FacebookAuthProvider.credential(accessToken.token);
      final UserCredential firebaseCredential = await _auth.signInWithCredential(facebookCredential);
      return Optional.of(UserModel.fromFirebaseCredentials(firebaseCredential));
    } else
      return Optional.empty();
  }
}
