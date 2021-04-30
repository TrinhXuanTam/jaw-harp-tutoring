import 'base_error.dart';

class ProductNotAvailableError extends BaseError {
  @override
  String get message => "Sorry, the product is not available at the moment!";
}
