import 'package:jews_harp/features/auth/data/models/user_model.dart';

abstract class IThirdPartyAuthenticationDataSource {
  Future<UserModel> getUserWithFacebook();
}
