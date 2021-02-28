part of 'password_reset_bloc.dart';

@immutable
abstract class PasswordResetEvent {}

class PasswordResetRequestEvent extends PasswordResetEvent {
  final String email;
  final String languageCode;

  PasswordResetRequestEvent(this.email, this.languageCode);
}
