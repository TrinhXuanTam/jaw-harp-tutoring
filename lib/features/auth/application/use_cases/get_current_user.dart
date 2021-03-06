import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/errors/user_not_signed_in_error.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';

@LazySingleton(env: [Environment.prod, Environment.dev, GET_CURRENT_USER_TEST_ENV])
class GetCurrentUser {
  final IUserRepository _userRepository;

  GetCurrentUser(this._userRepository);

  Future<User> call() async {
    final user = await _userRepository.getCurrentUser();

    if (user == null) throw UserNotSignedInError();

    return user;
  }
}