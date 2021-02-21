import 'package:jews_harp/core/errors/base_error.dart';

class UserNotVerifiedError extends BaseError {
  @override
  String get message => "User account is not verified!";
}
