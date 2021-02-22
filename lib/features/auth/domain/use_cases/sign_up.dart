import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:optional/optional.dart';

/// Create a new account use case
@LazySingleton(env: [Environment.prod, Environment.dev, SIGN_UP_TEST_ENV])
class SignUp {
  final IUserRepository _userRepository;

  SignUp(this._userRepository);

  Future<Optional<User>> call(
    String name,
    String email,
    String password,
  ) async {
    return _userRepository.createUser(name, email, password);
  }
}
