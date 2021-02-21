part of 'email_verification_bloc.dart';

@immutable
abstract class EmailVerificationEvent {}

class EmailVerificationRequestEvent extends EmailVerificationEvent {
  final User user;

  EmailVerificationRequestEvent(this.user);
}

class EmailVerificationClosedEvent extends EmailVerificationEvent {
  final User user;

  EmailVerificationClosedEvent(this.user);
}

class EmailVerificationContinueEvent extends EmailVerificationEvent {
  final User user;

  EmailVerificationContinueEvent(this.user);
}
