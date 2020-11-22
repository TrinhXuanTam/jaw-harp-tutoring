import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

class Config {
  static const String appTitle = "Jew\'s Harp";

  static Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }
}