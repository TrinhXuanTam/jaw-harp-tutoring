part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

/// Account was created
class SignUpSuccessState extends SignUpState {
  final User user;

  SignUpSuccessState(this.user);
}

/// Sign up failed
class SignUpFailedState extends SignUpState {
  final String message;

  SignUpFailedState(this.message);
}
