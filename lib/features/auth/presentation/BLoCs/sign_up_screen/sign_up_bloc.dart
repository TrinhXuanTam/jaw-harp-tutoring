import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/base_error.dart';
import 'package:jews_harp/core/errors/email_already_used_error.dart';
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart';
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart';
import 'package:jews_harp/features/auth/application/use_cases/link_email_provider.dart';
import 'package:jews_harp/features/auth/application/use_cases/sign_up.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUp _signUp;
  final GetAuthProviders _getAuthProviders;
  final LinkEmailProvider _linkEmailProvider;

  SignUpBloc(
    this._signUp,
    this._getAuthProviders,
    this._linkEmailProvider,
  ) : super(SignUpInitialState());

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if (event is SignUpButtonPressedEvent) {
      try {
        final user = await _signUp(event.name, event.email, event.password, event.passwordRepeat);
        yield SignUpSuccessState(user);
      } on EmailAlreadyUsedError catch (e) {
        final providers = await _getAuthProviders(event.email);

        if (providers.contains("password"))
          yield SignUpFailedState(e.message);
        else {
          providers.remove("password");
          yield MultipleProvidersState(event.email, providers, event.password);
        }
      } on BaseError catch (e) {
        yield SignUpFailedState(e.message);
      }
    }
    if (event is LinkEmailEvent) {
      try {
        final user = await _linkEmailProvider(event.email, event.password);
        yield SignUpSuccessState(user);
      } on BaseError catch (e) {
        yield SignUpFailedState(e.message);
      }
    }
  }
}
