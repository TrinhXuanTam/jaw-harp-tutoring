part of 'email_auth_bloc.dart';

@immutable
abstract class EmailAuthEvent {}

/// Indicates that user tries to sign in with email.
class EmailAuthenticationRequestEvent extends EmailAuthEvent {
  final String email;
  final String password;

  EmailAuthenticationRequestEvent(this.email, this.password);
}
