part of 'email_verification_bloc.dart';

@immutable
abstract class EmailVerificationEvent {}

/// User requests a new verification email
class EmailVerificationRequestEvent extends EmailVerificationEvent {
  final User user;

  EmailVerificationRequestEvent(this.user);
}

/// User closed the verification screen
class EmailVerificationClosedEvent extends EmailVerificationEvent {
  final User user;

  EmailVerificationClosedEvent(this.user);
}

/// User tries to continue to the main screen
class EmailVerificationContinueEvent extends EmailVerificationEvent {
  final User user;

  EmailVerificationContinueEvent(this.user);
}
