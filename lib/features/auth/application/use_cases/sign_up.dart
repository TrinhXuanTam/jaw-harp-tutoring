import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/errors/validation_error.dart';
import 'package:jews_harp/core/regex.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';

/// Create a new account.
@LazySingleton(env: [Environment.prod, Environment.dev, SIGN_UP_TEST_ENV])
class SignUp {
  final IUserAuthFacade _userAuthFacade;

  SignUp(this._userAuthFacade);

  Future<User> call(
    String name,
    String email,
    String password,
    String passwordRepeat,
  ) async {
    // Fields must not be empty.
    if (name.isEmpty || email.isEmpty || password.isEmpty || passwordRepeat.isEmpty) throw ValidationError("Please fill out all fields!");

    // Check email format.
    if (!RegExMatchers.email.hasMatch(email)) throw ValidationError("Invalid email format!");

    // Check password format.
    if (!RegExMatchers.password.hasMatch(password)) throw ValidationError("Password must contain 6 to 20 characters with at least one digit and character!");

    // Check if passwords are same.
    if (password != passwordRepeat) throw ValidationError("Passwords don't match!");

    return _userAuthFacade.signUpWithEmailAndPassword(name, email, password);
  }
}
