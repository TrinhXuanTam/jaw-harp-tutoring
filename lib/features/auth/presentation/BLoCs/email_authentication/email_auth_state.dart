part of 'email_auth_bloc.dart';

@immutable
abstract class EmailAuthState {}

class EmailAuthInitialState extends EmailAuthState {}

/// User successfully authenticated
class EmailAuthSuccessState extends EmailAuthState {
  final User user;

  EmailAuthSuccessState(this.user);
}

/// User is not authenticated
class EmailAuthFailedState extends EmailAuthState {
  final String message;

  EmailAuthFailedState(this.message);
}
