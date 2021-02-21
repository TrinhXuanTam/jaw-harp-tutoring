import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/regex.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/use_cases/sign_up.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUp _signUp;

  SignUpBloc(
    this._signUp,
  ) : super(SignUpInitialState());

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if (event is SignUpButtonPressedEvent) {
      final name = event.name;
      final email = event.email;
      final password = event.password;
      final passwordRepeat = event.passwordRepeat;

      // validation
      if (name.isEmpty || email.isEmpty || password.isEmpty || passwordRepeat.isEmpty)
        yield SignUpFailedState("Please fill out all fields!");
      else if (!RegExMatchers.email.hasMatch(email))
        yield SignUpFailedState("Invalid email format!");
      else if (!RegExMatchers.password.hasMatch(password))
        yield SignUpFailedState("Password must contain 6 to 20 characters with at least one digit and character!");
      else if (password != passwordRepeat)
        yield SignUpFailedState("Passwords don't match!");
      else {
        final optionalUser = await _signUp(name, email, password);
        if (optionalUser.isEmpty)
          yield SignUpFailedState("This email is already in use!");
        else {
          final user = optionalUser.value;
          user.sendVerificationEmail();
          yield SignUpSuccessState(user);
        }
      }
    }
  }
}
