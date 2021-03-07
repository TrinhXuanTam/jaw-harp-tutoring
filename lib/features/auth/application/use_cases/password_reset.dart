import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/errors/email_not_found_error.dart';
import 'package:jews_harp/core/errors/validation_error.dart';
import 'package:jews_harp/core/regex.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';

/// Get cached user use case
@LazySingleton(env: [Environment.prod, Environment.dev, PASSWORD_RESET_TEST_ENV])
class PasswordReset {
  final IUserFacade _userFacade;

  PasswordReset(this._userFacade);

  Future<void> call(String email, {String languageCode = "en"}) async {
    if (email.isEmpty) throw ValidationError("Please fill out all fields!");

    if (!RegExMatchers.email.hasMatch(email)) throw ValidationError("Invalid email format!");

    if (!await _userFacade.resetPassword(email)) throw EmailNotFoundError();
  }
}
