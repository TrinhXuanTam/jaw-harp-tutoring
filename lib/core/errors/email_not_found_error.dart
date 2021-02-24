import 'package:jews_harp/core/errors/base_error.dart';

class EmailNotFoundError extends BaseError {
  @override
  String get message => "Email not found!";
}
