import 'package:jews_harp/features/auth/data/models/user_model.dart';
import 'package:optional/optional.dart';

abstract class IThirdPartyAuthenticationDataSource {
  Future<Optional<UserModel>> getUserWithFacebook();

  Future<Optional<UserModel>> getUserWithGoogle();
}
