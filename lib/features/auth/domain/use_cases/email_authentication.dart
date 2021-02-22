import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:optional/optional.dart';

/// Sing in user with email and password use case
@LazySingleton(env: [Environment.prod, Environment.dev, EMAIL_AUTHENTICATION_TEST_ENV])
class EmailAuthentication {
  final IUserRepository _userRepository;

  EmailAuthentication(this._userRepository);

  Future<Optional<User>> call(String email, String password) {
    return _userRepository.getUserWithEmailAndPassword(email, password);
  }
}
