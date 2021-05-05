import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/BLoCs/connectivity/connectivity_bloc.dart';
import 'package:jews_harp/core/BLoCs/errors/error_bloc.dart';
import 'package:jews_harp/core/constants/auth_providers_id.dart';
import 'package:jews_harp/core/errors/base_error.dart';
import 'package:jews_harp/core/errors/email_already_used_error.dart';
import 'package:jews_harp/core/errors/no_internet_connection_error.dart';
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart';
import 'package:jews_harp/features/auth/application/use_cases/sign_up.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/auth_state/auth_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

/// Sign up form state management.
@Injectable(env: [Environment.prod, Environment.dev])
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUp _signUp;
  final GetAuthProviders _getAuthProviders;
  final ConnectivityBloc _connectivityBloc;
  final ErrorBloc _errorBloc;
  final AuthBloc _authBloc;

  SignUpBloc(
    this._signUp,
    this._getAuthProviders,
    this._connectivityBloc,
    this._errorBloc,
    this._authBloc,
  ) : super(SignUpInitialState());

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if (event is SignUpButtonPressedEvent) {
      try {
        // No internet connection found.
        if (_connectivityBloc.state is NoInternetConnection) throw NoInternetConnectionError();

        // Create the new account with given email and password.
        final user = await _signUp(event.name, event.email, event.password, event.passwordRepeat);
        _authBloc.add(UserAuthenticatedEvent(user));
      } on EmailAlreadyUsedError catch (e) {
        // Check if user signed up with email and password.
        final providers = await _getAuthProviders(event.email);
        if (providers.contains(EMAIL_PROVIDER))
          _errorBloc.add(UserErrorEvent("Failed to sign up", e.message));
        else {
          // Redirect to account link screen.
          providers.remove(EMAIL_PROVIDER);
          yield MultipleProvidersState(event.email, providers, event.password);
        }
      } on BaseError catch (e) {
        _errorBloc.add(UserErrorEvent("Failed to sign up", e.message));
      }
    }
  }
}
