import 'package:flutter/material.dart';

import 'package:jews_harp/core/utils/routes.dart';
import 'package:jews_harp/core/config/Config.dart';
import 'package:jews_harp/features/auth/presentation/screens/splash_screen.dart';

Future<void> main() async {
  await Config.initApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: Config.appTitle,
    routes: routes,
    home: SplashScreen(),
  ));
}
