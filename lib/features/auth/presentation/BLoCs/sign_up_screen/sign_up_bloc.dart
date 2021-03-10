import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/BLoCs/errors/error_bloc.dart';
import 'package:jews_harp/core/constants/auth_providers_id.dart';
import 'package:jews_harp/core/errors/base_error.dart';
import 'package:jews_harp/core/errors/email_already_used_error.dart';
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
  final ErrorBloc _errorBloc;

  SignUpBloc(
    this._signUp,
    this._getAuthProviders,
    this._linkEmailProvider,
    this._errorBloc,
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

        if (providers.contains(EMAIL_PROVIDER))
          _errorBloc.add(UserErrorEvent("Failed to sign up", e.message));
        else {
          providers.remove(EMAIL_PROVIDER);
          yield MultipleProvidersState(event.email, providers, event.password);
        }
      } on BaseError catch (e) {
        _errorBloc.add(UserErrorEvent("Failed to sign up", e.message));
      }
    }
    if (event is LinkEmailEvent) {
      try {
        final user = await _linkEmailProvider(event.email, event.password);
        yield SignUpSuccessState(user);
      } on BaseError catch (e) {
        _errorBloc.add(UserErrorEvent("Failed to sign up", e.message));
      }
    }
  }
}
