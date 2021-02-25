import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/infrastructure/data/data_sources/interfaces/remote/third_party_authentication.dart';
import 'package:jews_harp/features/auth/infrastructure/data/models/user_model.dart';
import 'package:optional/optional.dart';

/// Firebase [IThirdPartyAuthenticationDataSource] implementation
@LazySingleton(as: IThirdPartyAuthenticationDataSource, env: [Environment.prod])
class FirebaseThirdPartyAuth extends IThirdPartyAuthenticationDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<Optional<UserModel>> getUserWithFacebook() async {
    final FacebookLogin facebookLogin = FacebookLogin();

    final res = await facebookLogin.logIn(["public_profile", "email"]);

    if (res.status == FacebookLoginStatus.loggedIn) {
      final FacebookAccessToken accessToken = res.accessToken;
      final AuthCredential facebookCredential = FacebookAuthProvider.credential(accessToken.token);
      final UserCredential firebaseCredential = await _auth.signInWithCredential(facebookCredential);

      return Optional.of(UserModel.fromFirebaseCredentials(firebaseCredential));
    } else
      return Optional.empty();
  }

  @override
  Future<Optional<UserModel>> getUserWithGoogle() async {
    final GoogleSignIn googleLogin = GoogleSignIn(scopes: [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/userinfo.profile",
    ]);

    try {
      final GoogleSignInAccount googleSignInAccount = await googleLogin.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential googleCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential firebaseCredential = await _auth.signInWithCredential(googleCredential);

      return Optional.of(UserModel.fromFirebaseCredentials(firebaseCredential));
    } catch (_) {
      return Optional.empty();
    }
  }
}
