import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/BLoCs/errors/error_bloc.dart';
import 'package:jews_harp/core/errors/base_error.dart';
import 'package:jews_harp/features/auth/application/use_cases/password_reset.dart';
import 'package:meta/meta.dart';

part 'password_reset_event.dart';

part 'password_reset_state.dart';

/// Password reset state management.
@Injectable(env: [Environment.prod, Environment.dev])
class PasswordResetBloc extends Bloc<PasswordResetEvent, PasswordResetState> {
  final PasswordReset _resetPassword;
  final ErrorBloc _errorBloc;

  PasswordResetBloc(this._resetPassword, this._errorBloc) : super(PasswordResetInitial());

  @override
  Stream<PasswordResetState> mapEventToState(
    PasswordResetEvent event,
  ) async* {
    if (event is PasswordResetRequestEvent) {
      try {
        // Send email with password reset link.
        await _resetPassword(state.emailController.text);
        yield PasswordResetSuccess();
      } on BaseError catch (e) {
        _errorBloc.add(UserErrorEvent("Password reset failed", e.message));
      }
    }
  }
}
