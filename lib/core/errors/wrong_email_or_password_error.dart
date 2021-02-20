import 'package:jews_harp/core/errors/base_error.dart';

/// Error thrown when email or password is incorrect during authentication
class WrongEmailOrPasswordError implements BaseError {
  @override
  String get message => "Email or password is incorrect!";
}
