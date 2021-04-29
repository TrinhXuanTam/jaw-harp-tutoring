part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

/// Indicates that splash screen has been displayed.
class SplashScreenDisplayedEvent extends AuthEvent {
  final String languageCode;

  SplashScreenDisplayedEvent(this.languageCode);
}

/// App has been initialized.
class SplashScreenTransitionEvent extends AuthEvent {
  final User? user;

  SplashScreenTransitionEvent(this.user);
}

/// Indicates that user has successfully been authenticated.
class UserAuthenticatedEvent extends AuthEvent {}

/// User signs out.
class UserSignOutEvent extends AuthEvent {}
