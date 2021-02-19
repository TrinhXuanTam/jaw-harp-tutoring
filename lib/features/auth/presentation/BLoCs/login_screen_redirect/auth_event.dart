part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

/// Indicates that splash screen has been displayed
class SplashScreenDisplayedEvent extends AuthEvent {}

/// Indicates that user tries to sign in with email.
class EmailAuthenticationEvent extends AuthEvent {
  final String email;
  final String password;

  EmailAuthenticationEvent(this.email, this.password);
}
