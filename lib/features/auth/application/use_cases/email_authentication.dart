import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/errors/validation_error.dart';
import 'package:jews_harp/core/regex.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';

/// Sing in user with email and password use case
@LazySingleton(env: [Environment.prod, Environment.dev, EMAIL_AUTHENTICATION_TEST_ENV])
class EmailAuthentication {
  final IUserAuthFacade _userAuthFacade;

  EmailAuthentication(this._userAuthFacade);

  Future<User> call(String email, String password) async {
    // Email and password must not be empty.
    if (email.isEmpty || password.isEmpty) throw ValidationError("Please fill out all fields!");

    // Check email format.
    if (!RegExMatchers.email.hasMatch(email)) throw ValidationError("Invalid email format!");

    // Check password format.
    if (!RegExMatchers.password.hasMatch(password)) throw ValidationError("Invalid password format!");

    return _userAuthFacade.signInWithEmailAndPassword(email, password);
  }
}
