import 'package:jews_harp/core/errors/base_error.dart';

/// Error thrown when no signed in user is found
class UserNotSignedInError implements BaseError {
  @override
  String get message => "No logged in user found!";
}
