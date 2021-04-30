part of 'password_reset_bloc.dart';

@immutable
abstract class PasswordResetEvent {}

class PasswordResetRequestEvent extends PasswordResetEvent {}
