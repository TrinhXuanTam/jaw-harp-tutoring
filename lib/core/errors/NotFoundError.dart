import 'package:jews_harp/core/errors/base_error.dart';

class NotFoundError extends BaseError {
  @override
  final String message;

  NotFoundError(this.message);
}