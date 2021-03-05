part of 'email_verification_bloc.dart';

@immutable
abstract class EmailVerificationEvent {}

/// User requests a new verification email
class EmailVerificationRequestEvent extends EmailVerificationEvent {
  final String languageCode;

  EmailVerificationRequestEvent(this.languageCode);
}

/// User closed the verification screen
class EmailVerificationClosedEvent extends EmailVerificationEvent {}

/// User tries to continue to the main screen
class EmailVerificationContinueEvent extends EmailVerificationEvent {}
