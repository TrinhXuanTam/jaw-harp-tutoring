import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/BLoCs/errors/error_bloc.dart';
import 'package:jews_harp/features/auth/application/use_cases/reload_user.dart';
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart';
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/auth_state/auth_bloc.dart';
import 'package:meta/meta.dart';

part 'email_verification_event.dart';

part 'email_verification_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class EmailVerificationBloc extends Bloc<EmailVerificationEvent, EmailVerificationState> {
  final SignOut _signOut;
  final SendEmailVerification _sendEmailVerification;
  final ReloadUser _reloadUser;
  final ErrorBloc _errorBloc;
  final AuthBloc _authBloc;

  EmailVerificationBloc(
    this._signOut,
    this._sendEmailVerification,
    this._reloadUser,
    this._errorBloc,
    this._authBloc,
  ) : super(EmailVerificationInitialState());

  @override
  Stream<EmailVerificationState> mapEventToState(
    EmailVerificationEvent event,
  ) async* {
    if (event is EmailVerificationRequestEvent) {
      _sendEmailVerification();
      yield EmailVerificationSentState();
    } else if (event is EmailVerificationClosedEvent) {
      _signOut();
      yield EmailVerificationClosedState();
    } else if (event is EmailVerificationContinueEvent) {
      final user = await _reloadUser();
      if (user.isVerified)
        _authBloc.add(UserAuthenticatedEvent(user));
      else
        _errorBloc.add(UserErrorEvent("Email not verified", "Please verify your email before you continue!"));
    }
  }
}
