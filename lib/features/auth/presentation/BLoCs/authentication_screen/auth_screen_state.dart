part of 'auth_screen_bloc.dart';

@immutable
abstract class AuthScreenState {}

class AuthScreenInitialState extends AuthScreenState {}

/// User successfully authenticated
class AuthSuccessState extends AuthScreenState {
  final User user;

  AuthSuccessState(this.user);
}

/// User authenticated but account is not verified
class AuthNotVerifiedState extends AuthScreenState {
  final User user;

  AuthNotVerifiedState(this.user);
}

/// User is not authenticated
class AuthFailedState extends AuthScreenState {
  final String message;

  AuthFailedState(this.message);
}
