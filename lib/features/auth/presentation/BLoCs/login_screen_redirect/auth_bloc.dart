import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/use_cases/offline_authentication.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@injectable
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
        yield AuthenticatedState(user.value);
    } else if (event is UserAuthenticatedEvent) {
      yield AuthenticatedState(event.user);
    }
  }
}
