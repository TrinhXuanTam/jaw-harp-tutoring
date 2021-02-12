import 'package:jews_harp/core/errors/base_error.dart';

class NoLoggedUserError implements BaseError {
  @override
  String get message => "No logged in user found!";
}
