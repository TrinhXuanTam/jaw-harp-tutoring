import 'package:jews_harp/features/login/domain/entities/user.dart';

abstract class IUserRepository {
  Future<bool> userIsAdmin(User user);
}