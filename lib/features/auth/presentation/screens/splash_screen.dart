import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/locations.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/splash_screen/splash_screen_bloc.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocProvider<SplashScreenBloc>(
      lazy: false,
      create: (ctx) {
        final languageCode = AppLocalizations.of(context).locale.languageCode;
        return serviceLocator<SplashScreenBloc>()..add(SplashScreenDisplayedEvent(languageCode));
      },
      child: Container(
        decoration: BoxDecoration(
          // render linear gradient background
          gradient: LinearGradient(
            colors: [
              BASE_COLOR,
              BASE_COLOR_LIGHT,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          // render logo picture
          child: Image.asset(
            LOGO_LOCATION,
            color: Colors.white,
            alignment: Alignment.center,
            width: size.width * 0.2,
          ),
        ),
      ),
    );
  }
}
