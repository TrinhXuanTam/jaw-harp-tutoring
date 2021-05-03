import 'package:jews_harp/core/errors/base_error.dart';

class PurchaseFailedError extends BaseError {
  @override
  String get message => "Purchase has failed, please try again!";
}
