import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/BLoCs/connectivity/connectivity_bloc.dart';
import 'package:jews_harp/core/BLoCs/errors/error_bloc.dart';
import 'package:jews_harp/core/errors/base_error.dart';
import 'package:jews_harp/core/errors/no_internet_connection_error.dart';
import 'package:jews_harp/features/auth/application/use_cases/reload_user.dart';
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart';
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/auth_state/auth_bloc.dart';
import 'package:meta/meta.dart';

part 'email_verification_event.dart';

part 'email_verification_state.dart';

/// Email verification screen state management.
@Injectable(env: [Environment.prod, Environment.dev])
class EmailVerificationBloc extends Bloc<EmailVerificationEvent, EmailVerificationState> {
  final SignOut _signOut;
  final SendEmailVerification _sendEmailVerification;
  final ConnectivityBloc _connectivityBloc;
  final ReloadUser _reloadUser;
  final ErrorBloc _errorBloc;
  final AuthBloc _authBloc;

  EmailVerificationBloc(
    this._signOut,
    this._sendEmailVerification,
    this._connectivityBloc,
    this._reloadUser,
    this._errorBloc,
    this._authBloc,
  ) : super(EmailVerificationInitialState());

  @override
  Stream<EmailVerificationState> mapEventToState(
    EmailVerificationEvent event,
  ) async* {
    try {
      if (event is EmailVerificationRequestEvent) {
        // No internet connection found.
        if (_connectivityBloc.state is NoInternetConnection) throw NoInternetConnectionError();

        // Send email confirmation.
        _sendEmailVerification();
        yield EmailVerificationSentState();
      } else if (event is EmailVerificationClosedEvent) {
        // Verification page has been closed,
        // therefore sign out the user.
        _signOut();
        yield EmailVerificationClosedState();
      } else if (event is EmailVerificationContinueEvent) {
        // No internet connection found.
        if (_connectivityBloc.state is NoInternetConnection) throw NoInternetConnectionError();

        // Refresh the user data form firebase.
        final user = await _reloadUser();

        // Check if user account is verified.
        if (user.isVerified)
          _authBloc.add(UserAuthenticatedEvent(user));
        else
          _errorBloc.add(UserErrorEvent("Email not verified", "Please verify your email before you continue!"));
      }
    } on BaseError catch (e) {
      _errorBloc.add(UserErrorEvent("Email not verified", e.message));
    }
  }
}
