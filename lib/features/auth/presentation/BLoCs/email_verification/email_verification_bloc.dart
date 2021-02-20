import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:meta/meta.dart';

part 'email_verification_event.dart';

part 'email_verification_state.dart';

@injectable
class EmailVerificationBloc
    extends Bloc<EmailVerificationEvent, EmailVerificationState> {
  EmailVerificationBloc() : super(EmailVerificationInitialState());

  @override
  Stream<EmailVerificationState> mapEventToState(
    EmailVerificationEvent event,
  ) async* {
    if (event is EmailVerificationRequestEvent) {
      print(event.user.name);
      yield EmailVerificationSentState();
    }
  }
}
