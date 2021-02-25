import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/email_not_found_error.dart';
import 'package:jews_harp/core/errors/validation_error.dart';
import 'package:jews_harp/core/regex.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';

/// Get cached user use case
@LazySingleton(env: [Environment.prod, Environment.dev])
class PasswordReset {
  final IUserRepository _userRepository;
  final IUserFacade _userFacade;

  PasswordReset(this._userRepository, this._userFacade);

  Future<void> call(String email) async {
    if (email.isEmpty) throw ValidationError("Please fill out all fields!");

    if (!RegExMatchers.email.hasMatch(email)) throw ValidationError("Invalid email format!");

    if (!await _userFacade.resetPassword(email)) throw EmailNotFoundError();
  }
}
