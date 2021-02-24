import 'package:jews_harp/features/auth/data/models/user_model.dart';
import 'package:optional/optional.dart';

/// Authentication remote data source interface
abstract class IAuthenticationRemoteDataSource {
  Future<Optional<UserModel>> getUser(String email, String password);

  Future<Optional<UserModel>> createNewUser(String name, String email, String password);

  Future<bool> resetPassword(String email);
}
