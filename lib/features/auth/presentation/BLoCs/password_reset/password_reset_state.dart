part of 'password_reset_bloc.dart';

@immutable
abstract class PasswordResetState {
  final TextEditingController emailController = TextEditingController();
}

class PasswordResetInitial extends PasswordResetState {}

class PasswordResetSuccess extends PasswordResetState {}
