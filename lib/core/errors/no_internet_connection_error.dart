import 'package:jews_harp/core/errors/base_error.dart';

class NoInternetConnectionError extends BaseError {
  @override
  String get message => "No internet connection!";
}
