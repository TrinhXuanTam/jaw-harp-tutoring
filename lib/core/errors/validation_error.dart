import 'package:jews_harp/core/errors/base_error.dart';

class ValidationError extends BaseError {
  @override
  final String message;

  ValidationError(this.message);
}
