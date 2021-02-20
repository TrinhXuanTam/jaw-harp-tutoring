part of 'email_verification_bloc.dart';

@immutable
abstract class EmailVerificationEvent {}

class EmailVerificationRequestEvent extends EmailVerificationEvent {
  final User user;

  EmailVerificationRequestEvent(this.user);
}
