part of 'auth_screen_bloc.dart';

@immutable
abstract class AuthScreenState {}

class AuthScreenInitialState extends AuthScreenState {}

class AuthSuccessState extends AuthScreenState {
  final User user;

  AuthSuccessState(this.user);
}

class AuthFailedState extends AuthScreenState {
  final String message;

  AuthFailedState(this.message);
}
