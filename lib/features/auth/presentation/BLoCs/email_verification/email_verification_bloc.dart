import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:meta/meta.dart';

part 'email_verification_event.dart';

part 'email_verification_state.dart';

@injectable
class EmailVerificationBloc extends Bloc<EmailVerificationEvent, EmailVerificationState> {
  EmailVerificationBloc() : super(EmailVerificationInitialState());

  @override
  Stream<EmailVerificationState> mapEventToState(
    EmailVerificationEvent event,
  ) async* {
    if (event is EmailVerificationRequestEvent) {
      event.user.sendVerificationEmail();
      yield EmailVerificationSentState();
    } else if (event is EmailVerificationClosedEvent) {
      event.user.signOut();
      yield EmailVerificationClosedState();
    } else if (event is EmailVerificationContinueEvent) {
      if (await event.user.isVerified())
        yield EmailVerifiedState();
      else
        yield EmailNotVerifiedState();
    }
  }
}
