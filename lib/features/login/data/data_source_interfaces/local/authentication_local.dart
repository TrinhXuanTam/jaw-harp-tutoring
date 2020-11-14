import 'package:jews_harp/features/login/data/models/user_model.dart';

abstract class IAuthenticationLocalDataSource {
  Future<UserModel> getCurrentUser();
}
