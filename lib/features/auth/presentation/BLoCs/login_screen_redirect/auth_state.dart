part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

/// Initial state.
class AuthInitialState extends AuthState {
  @override
  List<Object> get props => [];
}

/// User is unauthenticated state.
class UnauthenticatedState extends AuthState {
  @override
  List<Object> get props => [];
}

/// User is authenticated state.
class AuthenticatedState extends AuthState {
  @override
  List<Object> get props => [];
}
