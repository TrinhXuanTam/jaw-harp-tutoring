import 'package:firebase_core/firebase_core.dart';

class Config {
  static const String appTitle = "Jew\'s Harp";

  static Future<void> initApp() async {
    Firebase.initializeApp();
  }
}