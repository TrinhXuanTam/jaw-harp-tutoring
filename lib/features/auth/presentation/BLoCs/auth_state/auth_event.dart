part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

/// Indicates that user has successfully been authenticated.
class UserAuthenticatedEvent extends AuthEvent {
  final User user;

  UserAuthenticatedEvent(this.user);
}

/// Refresh user data.
class ReloadUserData extends AuthEvent {}

/// User signs out.
class UserSignOutEvent extends AuthEvent {}
