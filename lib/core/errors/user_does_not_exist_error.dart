import 'package:jews_harp/core/errors/base_error.dart';

class UserDoesNotExistError extends BaseError {
  @override
  String get message => "User doesn't exist!";
}
