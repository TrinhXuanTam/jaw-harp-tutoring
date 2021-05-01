part of 'email_form_bloc.dart';

@immutable
abstract class EmailFormState {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
}

class EmailFormInitial extends EmailFormState {}
