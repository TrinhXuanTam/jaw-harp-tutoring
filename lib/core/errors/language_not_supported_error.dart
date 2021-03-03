import 'base_error.dart';

class LanguageNotSupportedError extends BaseError {
  @override
  String get message => "Language not supported!";
}
