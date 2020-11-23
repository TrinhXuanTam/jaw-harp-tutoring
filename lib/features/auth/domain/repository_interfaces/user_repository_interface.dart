import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:optional/optional_internal.dart';

abstract class IUserRepository {
  Future<bool> userIsAdmin(User user);

  Future<Optional<User>> getCurrentUser();
}