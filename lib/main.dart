import 'package:flutter/material.dart';

import 'package:jews_harp/core/utils/routes.dart';
import 'package:jews_harp/core/config/Config.dart';
import 'package:jews_harp/features/login/presentation/screens/splash_screen.dart';

void main() {
  Config.initApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: Config.appTitle,
    routes: routes,
    home: SplashScreen(),
  ));
}
