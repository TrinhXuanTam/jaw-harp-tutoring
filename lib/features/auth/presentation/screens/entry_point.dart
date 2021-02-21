import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jews_harp/core/constants.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/dummy_screen.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/transitions.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/screens/authentication_screen.dart';
import 'package:jews_harp/features/auth/presentation/screens/email_verification_screen.dart';
import 'package:jews_harp/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:jews_harp/features/auth/presentation/screens/splash_screen.dart';

/// Entry point of the application
class EntryPoint extends StatelessWidget {
  /// After a period of [Constants.SPLASH_SCREEN_DURATION] send a [SplashScreenDisplayedEvent] to [AuthBloc].
  Future<void> _splashScreenRedirectWithDelay(BuildContext ctx) async {
    // Future that is called after a period of [Duration]
    return Future.delayed(
      const Duration(seconds: SPLASH_SCREEN_DURATION),
      () => BlocProvider.of<AuthBloc>(ctx).add(
        SplashScreenDisplayedEvent(),
      ),
    );
  }

  /// Display splash screen for [Constants.SPLASH_SCREEN_DURATION] and then check for check if user is signed in.
  /// Redirect the user into the authentication screen if user is not signed in.
  /// Otherwise, redirect the user into the main screen.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<AuthBloc>(),
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
        routes: {
          AuthenticationScreen.route: (_) => AuthenticationScreen(),
          SignUpScreen.route: (_) => SignUpScreen(),
          EmailVerificationScreen.route: (ctx) => EmailVerificationScreen(user: ModalRoute.of(ctx).settings.arguments),
        },
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (ctx, state) {
            if (state is AuthInitialState) {
              _splashScreenRedirectWithDelay(ctx);
              return fadeTransition(SplashScreen());
            } else if (state is AuthenticatedState)
              return fadeTransition(DummyScreen());
            else
              return fadeTransition(AuthenticationScreen());
          },
        ),
      ),
    );
  }
}
