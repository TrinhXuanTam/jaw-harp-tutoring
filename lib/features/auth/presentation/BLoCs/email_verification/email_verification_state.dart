part of 'email_verification_bloc.dart';

@immutable
abstract class EmailVerificationState {}

class EmailVerificationInitialState extends EmailVerificationState {}

/// Email verification was sent
class EmailVerificationSentState extends EmailVerificationState {}

/// Email verification closed (user returned to authentication screen)
class EmailVerificationClosedState extends EmailVerificationState {}

/// Email has been verified
class EmailVerifiedState extends EmailVerificationState {}

/// Email is not verified
class EmailNotVerifiedState extends EmailVerificationState {}
