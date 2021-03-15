import 'package:jews_harp/core/errors/base_error.dart';

class MediaNotFoundError extends BaseError {
  @override
  String get message => "Media was not found!";
}
