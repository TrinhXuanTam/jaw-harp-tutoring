import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';

@LazySingleton(env: [Environment.prod, Environment.dev, GET_CURRENT_USER_TEST_ENV])
class GetCurrentUser {
  final IUserRepository _userRepository;

  GetCurrentUser(this._userRepository);

  Future<User?> call() => _userRepository.getCurrentUser();
}
