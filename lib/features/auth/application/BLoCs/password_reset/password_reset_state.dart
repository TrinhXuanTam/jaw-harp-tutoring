part of 'password_reset_bloc.dart';

@immutable
abstract class PasswordResetState {}

class PasswordResetInitial extends PasswordResetState {}

class PasswordResetSuccess extends PasswordResetState {}

class PasswordResetFail extends PasswordResetState {
  final String message;

  PasswordResetFail(this.message);
}
