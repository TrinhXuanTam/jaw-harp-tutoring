import 'package:jews_harp/features/auth/data/models/user_model.dart';

abstract class IAuthenticationLocalDataSource {
  Future<UserModel> getCurrentUser();
}
