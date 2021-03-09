import 'package:jews_harp/core/errors/base_error.dart';

class TechniqueAlreadyExistsError extends BaseError {
  @override
  String get message => "Technique with the given product ID already exist!";
}
