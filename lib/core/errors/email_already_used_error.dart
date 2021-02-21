import 'base_error.dart';

/// Error thrown when email or password is incorrect during authentication
class EmailAlreadyUsedError implements BaseError {
  @override
  String get message => "This email is already in use!";
}
