import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';

/// Check if email is verified.
@LazySingleton(env: [Environment.prod, Environment.dev, RELOAD_USER_TEST_ENV])
class ReloadUser {
  final IUserAuthRepository _userRepository;

  ReloadUser(this._userRepository);

  Future<User> call() async => _userRepository.reloadUser();
}
