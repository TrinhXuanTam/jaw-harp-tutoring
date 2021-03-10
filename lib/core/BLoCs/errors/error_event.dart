part of 'error_bloc.dart';

@immutable
abstract class ErrorEvent {}

/// Error was resolved
class ErrorResolvedEvent extends ErrorEvent {}

/// Error made by the user
class UserErrorEvent extends ErrorEvent {
  final String title;
  final String message;

  UserErrorEvent(this.title, this.message);
}
