part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

/// User is unauthenticated state.
class UserUnauthenticated extends AuthState {}

/// User is authenticated state.
class UserAuthenticated extends AuthState {
  final User user;

  UserAuthenticated(this.user);
}
