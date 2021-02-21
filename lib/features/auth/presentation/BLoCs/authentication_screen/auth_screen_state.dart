part of 'auth_screen_bloc.dart';

@immutable
abstract class AuthScreenState {}

class AuthScreenInitialState extends AuthScreenState {}

class AuthSuccessState extends AuthScreenState {
  final User user;

  AuthSuccessState(this.user);
}

class AuthNotVerifiedState extends AuthScreenState {
  final User user;

  AuthNotVerifiedState(this.user);
}

class AuthFailedState extends AuthScreenState {
  final String message;

  AuthFailedState(this.message);
}
