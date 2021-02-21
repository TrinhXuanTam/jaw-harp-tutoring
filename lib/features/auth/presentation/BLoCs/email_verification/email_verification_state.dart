part of 'email_verification_bloc.dart';

@immutable
abstract class EmailVerificationState {}

class EmailVerificationInitialState extends EmailVerificationState {}

class EmailVerificationSentState extends EmailVerificationState {}

class EmailVerificationClosedState extends EmailVerificationState {}

class EmailVerifiedState extends EmailVerificationState {}

class EmailNotVerifiedState extends EmailVerificationState {}
