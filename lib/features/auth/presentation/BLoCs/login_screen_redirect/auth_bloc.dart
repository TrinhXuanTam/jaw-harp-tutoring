import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/settings.dart';
import 'package:jews_harp/features/auth/application/use_cases/email_verification_check.dart';
import 'package:jews_harp/features/auth/application/use_cases/get_current_user.dart';
import 'package:jews_harp/features/auth/application/use_cases/set_locale.dart';
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetCurrentUser _getCurrentUser;
  final EmailIsVerified _emailIsVerified;
  final SetLocale _setLocale;
  final SignOut _signOut;

  AuthBloc(
    this._getCurrentUser,
    this._emailIsVerified,
    this._setLocale,
    this._signOut,
  ) : super(AuthInitialState());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is SplashScreenDisplayedEvent) {
      final user = await _getCurrentUser();
      _setLocale(event.languageCode);
      Future.delayed(
        const Duration(seconds: SPLASH_SCREEN_DURATION),
        () => this.add(SplashScreenTransitionEvent(user)),
      );
    } else if (event is SplashScreenTransitionEvent) {
      final user = event.user;
      if (user == null)
        yield UnauthenticatedState();
      else if (!await _emailIsVerified())
        yield NotVerifiedState(user);
      else
        yield AuthenticatedState(user);
    } else if (event is UserAuthenticatedEvent) {
      if (!await _emailIsVerified())
        yield NotVerifiedState(event.user);
      else
        yield AuthenticatedState(event.user);
    } else if (event is UserSignOutEvent) {
      await _signOut();
      yield UnauthenticatedState();
    }
  }
}
