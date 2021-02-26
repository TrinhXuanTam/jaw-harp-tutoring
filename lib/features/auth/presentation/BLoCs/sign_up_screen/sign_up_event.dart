part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

/// User has pressed the sign up button
class SignUpButtonPressedEvent extends SignUpEvent {
  final String name;
  final String email;
  final String password;
  final String passwordRepeat;

  SignUpButtonPressedEvent(
    this.name,
    this.email,
    this.password,
    this.passwordRepeat,
  );
}

class LinkEmailEvent extends SignUpEvent {
  final String email;
  final String password;

  LinkEmailEvent(this.email, this.password);
}
