import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/base_error.dart';
import 'package:jews_harp/features/auth/application/use_cases/password_reset.dart';
import 'package:meta/meta.dart';

part 'password_reset_event.dart';

part 'password_reset_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class PasswordResetBloc extends Bloc<PasswordResetEvent, PasswordResetState> {
  final PasswordReset _resetPassword;

  PasswordResetBloc(this._resetPassword) : super(PasswordResetInitial());

  @override
  Stream<PasswordResetState> mapEventToState(
    PasswordResetEvent event,
  ) async* {
    if (event is PasswordResetRequestEvent) {
      try {
        await _resetPassword(event.email);
        yield PasswordResetSuccess();
      } on BaseError catch (e) {
        yield PasswordResetFail(e.message);
      }
    }
  }
}
