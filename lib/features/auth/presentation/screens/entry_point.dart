import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/settings.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/dummy_screen.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/screens/authentication_screen.dart';
import 'package:jews_harp/features/auth/presentation/screens/email_verification_screen.dart';
import 'package:jews_harp/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:jews_harp/features/auth/presentation/screens/splash_screen.dart';

/// Entry point of the application
class EntryPoint extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey();

  /// After a period of [Constants.SPLASH_SCREEN_DURATION] send a [SplashScreenDisplayedEvent] to [AuthBloc].
  Future<void> _splashScreenRedirectWithDelay(AuthBloc authBloc) async {
    // Future that is called after a period of [Duration]
    return Future.delayed(
      const Duration(seconds: SPLASH_SCREEN_DURATION),
      () => authBloc.add(SplashScreenDisplayedEvent()),
    );
  }

  void _authBlocListener(BuildContext context, AuthState state) {
    if (state is AuthenticatedState)
      navigatorKey.currentState.pushNamedAndRemoveUntil(HOME_SCREEN_ROUTE, (route) => false);
    else if (state is UnauthenticatedState) navigatorKey.currentState.pushReplacementNamed(AUTH_SCREEN_ROUTE);
  }

  /// Display splash screen for [Constants.SPLASH_SCREEN_DURATION] and then check for check if user is signed in.
  /// Redirect the user into the authentication screen if user is not signed in.
  /// Otherwise, redirect the user into the main screen.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final authBloc = serviceLocator<AuthBloc>();
        _splashScreenRedirectWithDelay(authBloc);
        return authBloc;
      },
      child: BlocListener<AuthBloc, AuthState>(
        listener: _authBlocListener,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: APP_TITLE,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en', ''),
            Locale('cs', 'CZ'),
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode && supportedLocale.countryCode == locale.countryCode) return supportedLocale;
            }
            return supportedLocales.first;
          },
          navigatorKey: navigatorKey,
          routes: {
            // TODO: Home screen
            SPLASH_SCREEN_ROUTE: (_) => SplashScreen(),
            HOME_SCREEN_ROUTE: (_) => DummyScreen(),
            AUTH_SCREEN_ROUTE: (_) => AuthenticationScreen(),
            SIGN_UP_SCREEN_ROUTE: (_) => SignUpScreen(),
            EMAIL_VERIFICATION_UP_SCREEN_ROUTE: (ctx) => EmailVerificationScreen(user: ModalRoute.of(ctx).settings.arguments),
          },
          initialRoute: SPLASH_SCREEN_ROUTE,
        ),
      ),
    );
  }
}
