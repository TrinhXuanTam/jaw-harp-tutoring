import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:jews_harp/core/utils/routes.dart';
import 'package:jews_harp/core/config/Config.dart';
import 'package:jews_harp/features/login/presentation/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: Config.appTitle,
    routes: routes,
    home: SplashScreen(),
  ));
}
