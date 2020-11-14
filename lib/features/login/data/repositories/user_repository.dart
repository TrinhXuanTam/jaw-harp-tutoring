import 'package:jews_harp/features/login/domain/entities/user.dart';
import 'package:jews_harp/features/login/domain/repository_interfaces/user_repository_interface.dart';

class UserRepository implements IUserRepository {
  @override
  Future<bool> userIsAdmin(User user) {
    return Future.value(user.isAdmin);
  }

}
