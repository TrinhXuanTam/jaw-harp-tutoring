import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/base_error.dart';
import 'package:jews_harp/features/auth/application/use_cases/offline_authentication.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final OfflineAuthentication _offlineAuth;

  AuthBloc(this._offlineAuth) : super(AuthInitialState());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is SplashScreenDisplayedEvent) {
      try {
        var user = await _offlineAuth();
        yield AuthenticatedState(user);
      } on BaseError {
        yield UnauthenticatedState();
      }
    } else if (event is UserAuthenticatedEvent) {
      yield AuthenticatedState(event.user);
    } else if (event is UserSignOutEvent) {
      event.user.signOut();
      yield UnauthenticatedState();
    }
  }
}
