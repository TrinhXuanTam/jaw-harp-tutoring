import 'package:jews_harp/features/auth/data/models/user_model.dart';

/// Authentication remote data source interface
abstract class IAuthenticationRemoteDataSource {
  Future<UserModel> getUser(String email, String password);

  Future<UserModel> createNewUser(String name, String email, String password);
}
