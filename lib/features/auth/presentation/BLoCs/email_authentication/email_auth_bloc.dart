import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/base_error.dart';
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:meta/meta.dart';

part 'email_auth_event.dart';

part 'email_auth_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class EmailAuthBloc extends Bloc<EmailAuthEvent, EmailAuthState> {
  final EmailAuthentication _emailAuthentication;

  EmailAuthBloc(this._emailAuthentication) : super(EmailAuthInitialState());

  @override
  Stream<EmailAuthState> mapEventToState(
    EmailAuthEvent event,
  ) async* {
    if (event is EmailAuthenticationRequestEvent) {
      try {
        final user = await _emailAuthentication(event.email, event.password);

        yield EmailAuthSuccessState(user);
      } on BaseError catch (e) {
        yield EmailAuthFailedState(e.message);
      }
    }
  }
}
