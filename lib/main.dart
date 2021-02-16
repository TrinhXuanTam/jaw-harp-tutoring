import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jews_harp/core/widgets/entry_point.dart';
import 'core/dependency_injection/service_locator.dart';

Future<void> main() async {
  // Initialize dependencies
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();

  // Run the app
  runApp(EntryPoint());
}
