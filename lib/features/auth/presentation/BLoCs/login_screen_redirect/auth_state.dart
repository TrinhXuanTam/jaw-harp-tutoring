part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

/// Initial state.
class AuthInitialState extends AuthState {}

/// User is unauthenticated state.
class UnauthenticatedState extends AuthState {}

/// User is authenticated state.
class AuthenticatedState extends AuthState {}
