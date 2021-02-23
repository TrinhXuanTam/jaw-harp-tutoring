import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants.dart';
import 'package:jews_harp/core/errors/email_already_used_error.dart';
import 'package:jews_harp/core/errors/validation_error.dart';
import 'package:jews_harp/core/regex.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';

/// Create a new account use case
@LazySingleton(env: [Environment.prod, Environment.dev, SIGN_UP_TEST_ENV])
class SignUp {
  final IUserRepository _userRepository;

  SignUp(this._userRepository);

  Future<User> call(
    String name,
    String email,
    String password,
    String passwordRepeat,
  ) async {
    if (name.isEmpty || email.isEmpty || password.isEmpty || passwordRepeat.isEmpty) throw ValidationError("Please fill out all fields!");

    if (!RegExMatchers.email.hasMatch(email)) throw ValidationError("Invalid email format!");

    if (!RegExMatchers.password.hasMatch(password)) throw ValidationError("Password must contain 6 to 20 characters with at least one digit and character!");

    if (password != passwordRepeat) throw ValidationError("Passwords don't match!");

    final user = await _userRepository.createUser(name, email, password);

    if (user.isEmpty) throw EmailAlreadyUsedError();

    return user.value;
  }
}
