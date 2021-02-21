part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

/// Indicates that splash screen has been displayed.
class SplashScreenDisplayedEvent extends AuthEvent {}

/// Indicates that user has successfully been authenticated.
class UserAuthenticatedEvent extends AuthEvent {
  final User user;

  UserAuthenticatedEvent(this.user);
}
