import 'package:jews_harp/core/errors/base_error.dart';

class ThirdPartyAuthError extends BaseError {
  @override
  final String message;

  ThirdPartyAuthError(this.message);
}
