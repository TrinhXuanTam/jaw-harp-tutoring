import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/utils/regex.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/use_cases/email_authentication.dart';
import 'package:meta/meta.dart';

part 'auth_screen_event.dart';

part 'auth_screen_state.dart';

@injectable
class AuthScreenBloc extends Bloc<AuthScreenEvent, AuthScreenState> {
  final EmailAuthentication _emailAuthentication;

  AuthScreenBloc(this._emailAuthentication) : super(AuthScreenInitialState());

  @override
  Stream<AuthScreenState> mapEventToState(
    AuthScreenEvent event,
  ) async* {
    if (event is EmailAuthenticationEvent) {
      final email = event.email;
      final password = event.password;

      // validation
      if (email.isEmpty || password.isEmpty)
        yield AuthFailedState("Please fill out all fields!");
      else if (!RegExMatchers.email.hasMatch(email))
        yield AuthFailedState("Invalid email format!");
      else if (!RegExMatchers.password.hasMatch(password))
        yield AuthFailedState("Invalid password format!");
      else {
        final optionalUser = await _emailAuthentication(email, password);

        if (optionalUser.isEmpty)
          yield AuthFailedState("Email or password is incorrect!");
        else
          yield AuthSuccessState(optionalUser.value);
      }
    }
  }
}
