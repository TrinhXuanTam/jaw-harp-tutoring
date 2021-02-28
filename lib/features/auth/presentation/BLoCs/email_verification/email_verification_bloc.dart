import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/application/use_cases/email_verification_check.dart';
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart';
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:meta/meta.dart';

part 'email_verification_event.dart';

part 'email_verification_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class EmailVerificationBloc extends Bloc<EmailVerificationEvent, EmailVerificationState> {
  final SignOut _signOut;
  final SendEmailVerification _sendEmailVerification;
  final EmailIsVerified _emailIsVerified;

  EmailVerificationBloc(
    this._signOut,
    this._sendEmailVerification,
    this._emailIsVerified,
  ) : super(EmailVerificationInitialState());

  @override
  Stream<EmailVerificationState> mapEventToState(
    EmailVerificationEvent event,
  ) async* {
    if (event is EmailVerificationRequestEvent) {
      _sendEmailVerification(languageCode: event.languageCode);
      yield EmailVerificationSentState();
    } else if (event is EmailVerificationClosedEvent) {
      _signOut();
      yield EmailVerificationClosedState();
    } else if (event is EmailVerificationContinueEvent) {
      if (await _emailIsVerified())
        yield EmailVerifiedState();
      else
        yield EmailNotVerifiedState();
    }
  }
}
