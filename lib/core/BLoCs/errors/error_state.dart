part of 'error_bloc.dart';

@immutable
abstract class ErrorState {}

class NoErrorState extends ErrorState {}

class UserErrorOccurredState extends ErrorState {
  final String title;
  final String message;

  UserErrorOccurredState(this.title, this.message);
}
