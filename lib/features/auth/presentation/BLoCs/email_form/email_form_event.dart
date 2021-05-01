part of 'email_form_bloc.dart';

@immutable
abstract class EmailFormEvent {}

/// User tries to sign in with email.
class EmailAuthenticationRequestEvent extends EmailFormEvent {}
