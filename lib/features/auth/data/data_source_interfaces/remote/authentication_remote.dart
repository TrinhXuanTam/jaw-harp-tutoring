import 'package:jews_harp/features/auth/data/models/user_model.dart';

/// Authentication remote data source interface
abstract class IAuthenticationRemoteDataSource {
  /// Sign user in with email and password
  Future<UserModel> signInWithEmail(String email, String password);
}
