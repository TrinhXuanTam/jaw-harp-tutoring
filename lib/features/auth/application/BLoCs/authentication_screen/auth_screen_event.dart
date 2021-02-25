part of 'auth_screen_bloc.dart';

@immutable
abstract class AuthScreenEvent {}

/// Indicates that user tries to sign in with email.
class EmailAuthenticationEvent extends AuthScreenEvent {
  final String email;
  final String password;

  EmailAuthenticationEvent(this.email, this.password);
}