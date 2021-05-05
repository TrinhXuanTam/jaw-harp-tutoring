import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/settings.dart';
import 'package:jews_harp/features/auth/application/use_cases/get_current_user.dart';
import 'package:jews_harp/features/auth/application/use_cases/set_locale.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/auth_state/auth_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wakelock/wakelock.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

/// Splash screen state management.
@Injectable(env: [Environment.prod, Environment.dev])
class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final GetCurrentUser _getCurrentUser;
  final SetLocale _setLocale;
  final AuthBloc _authBloc;

  SplashScreenBloc(this._getCurrentUser, this._setLocale, this._authBloc) : super(SplashScreenInitial());

  @override
  Stream<SplashScreenState> mapEventToState(SplashScreenEvent event) async* {
    if (event is SplashScreenDisplayedEvent) {
      // Set Firebase locale.
      _setLocale(event.languageCode);
      // Disable device auto sleep mode.
      Wakelock.enabled;
      // Sign in user after [SPLASH_SCREEN_DURATION] seconds.
      Future.delayed(
        const Duration(seconds: SPLASH_SCREEN_DURATION),
        () => this.add(SplashScreenTransitionEvent()),
      );
    } else if (event is SplashScreenTransitionEvent) {
      // Try to sign in the user.
      final user = await _getCurrentUser();
      if (user != null)
        _authBloc.add(UserAuthenticatedEvent(user));
      else
        _authBloc.add(UserSignOutEvent());
    }
  }
}
