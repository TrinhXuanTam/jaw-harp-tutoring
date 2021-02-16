import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/utils/constants.dart';
import 'package:jews_harp/core/utils/dummy_screen.dart';
import 'package:jews_harp/core/utils/routes.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/screens/splash_screen.dart';

/// Entry point of the application
class EntryPoint extends StatelessWidget {
  /// After a period of [Constants.SPLASH_SCREEN_DURATION] send a [SplashScreenDisplayedEvent] to [AuthBloc]
  void _splashScreenRedirectWithDelay(BuildContext ctx) {
    Future.delayed(
      const Duration(seconds: Constants.SPLASH_SCREEN_DURATION),
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.APP_TITLE,
      routes: routes,
      home: BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (ctx, state) {
            if (state is AuthInitialState) {
              _splashScreenRedirectWithDelay(ctx);
              return SplashScreen();
            } else if (state is AuthenticatedState)
              return Container();
            else
              return DummyScreen();
          },
        ),
      ),
    );
  }
}
