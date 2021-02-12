import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';

import 'package:jews_harp/core/utils/routes.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/screens/splash_screen.dart';

class Config {
  static const String appTitle = "Jew\'s Harp";
  static const int splashScreenDuration = 3;

  static Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
    configureDependencies();
  }

  static Widget getEntryPoint() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      routes: routes,
      home: BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (_, state) {
            if (state is AuthInitial)
              return SplashScreen();
            else if(state is Unauthenticated)
              return Container();
            else
              return Container();
          },
        ),
      ),
    );
  }
}
