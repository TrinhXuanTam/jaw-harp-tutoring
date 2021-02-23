import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/base_error.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/use_cases/sign_up.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
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
      try {
        final user = await _signUp(event.name, event.email, event.password, event.passwordRepeat);
        user.sendVerificationEmail();
        yield SignUpSuccessState(user);
      } on BaseError catch (e) {
        yield SignUpFailedState(e.message);
      }
    }
  }
}
