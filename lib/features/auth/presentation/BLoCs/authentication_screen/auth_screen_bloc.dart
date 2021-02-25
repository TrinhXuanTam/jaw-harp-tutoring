import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/base_error.dart';
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart';
import 'package:jews_harp/features/auth/application/use_cases/email_verification_check.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:meta/meta.dart';

part 'auth_screen_event.dart';

part 'auth_screen_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class AuthScreenBloc extends Bloc<AuthScreenEvent, AuthScreenState> {
  final EmailAuthentication _emailAuthentication;
  final EmailIsVerified _emailIsVerified;

  AuthScreenBloc(
    this._emailAuthentication,
    this._emailIsVerified,
  ) : super(AuthScreenInitialState());

  @override
  Stream<AuthScreenState> mapEventToState(
    AuthScreenEvent event,
  ) async* {
    if (event is EmailAuthenticationEvent) {
      try {
        final user = await _emailAuthentication(event.email, event.password);

        if (!await _emailIsVerified())
          yield AuthNotVerifiedState(user);
        else
          yield AuthSuccessState(user);
      } on BaseError catch (e) {
        yield AuthFailedState(e.message);
      }
    }
  }
}
