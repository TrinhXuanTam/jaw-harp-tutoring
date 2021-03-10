part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

/// Multiple providers are found
class MultipleProvidersState extends SignUpState {
  final String email;
  final String password;
  final Set<String> providers;

  MultipleProvidersState(this.email, this.providers, this.password);
}
