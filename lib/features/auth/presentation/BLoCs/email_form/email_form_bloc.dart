import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/BLoCs/errors/error_bloc.dart';
import 'package:jews_harp/core/errors/base_error.dart';
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/auth_state/auth_bloc.dart';
import 'package:meta/meta.dart';

part 'email_form_event.dart';
part 'email_form_state.dart';

/// Email form state management.
@injectable
class EmailFormBloc extends Bloc<EmailFormEvent, EmailFormState> {
  final EmailAuthentication _emailAuthentication;
  final ErrorBloc _errorBloc;
  final AuthBloc _authBloc;

  EmailFormBloc(this._emailAuthentication, this._errorBloc, this._authBloc) : super(EmailFormInitial());

  @override
  Stream<EmailFormState> mapEventToState(
      EmailFormEvent event,
      ) async* {
    if (event is EmailAuthenticationRequestEvent) {
      try {
        final user = await _emailAuthentication(state.emailController.text, state.passwordController.text);
        _authBloc.add(UserAuthenticatedEvent(user));
      } on BaseError catch (e) {
        _errorBloc.add(UserErrorEvent("Failed to sign in", e.message));
      }
    }
  }
}
