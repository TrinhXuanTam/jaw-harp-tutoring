import 'package:jews_harp/core/errors/base_error.dart';

class ThirdPartyAuthenticationError extends BaseError {
  @override
  final String message;

  ThirdPartyAuthenticationError(this.message);
}
