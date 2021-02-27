import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';

@LazySingleton(env: [Environment.prod, Environment.dev, GOOGLE_AUTHENTICATION_TEST_ENV])
class GoogleAuthentication {
  final IUserRepository _userRepository;

  GoogleAuthentication(this._userRepository);

  Future<User> call() async => _userRepository.getUserWithGoogle();
}
