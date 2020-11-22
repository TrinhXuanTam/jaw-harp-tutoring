import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

import 'package:jews_harp/core/dependency_injection/service_locator.dart';

class Config {
  static const String appTitle = "Jew\'s Harp";

  static Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
    initServiceLocator();
  }
}