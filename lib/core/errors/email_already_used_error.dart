import 'package:jews_harp/core/errors/base_error.dart';

/// Error thrown when email or password is incorrect during authentication
class EmailAlreadyUsedError implements BaseError {
  final String email;

  EmailAlreadyUsedError(this.email);

  @override
  String get message => "This email is already in use!";
}
