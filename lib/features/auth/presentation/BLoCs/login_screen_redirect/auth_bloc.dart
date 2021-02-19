import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jews_harp/features/auth/domain/use_cases/offline_authentication.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final OfflineAuthentication _offlineAuth;

  AuthBloc(this._offlineAuth) : super(AuthInitialState());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is SplashScreenDisplayedEvent) {
      // Check if user is authenticated
      var user = await _offlineAuth();

      if (user.isEmpty)
        yield UnauthenticatedState();
      else
        yield AuthenticatedState();
    } else if (event is EmailAuthenticationEvent) {
      print(event.email);
      print(event.password);
      yield AuthenticatedState();
    }
  }
}
