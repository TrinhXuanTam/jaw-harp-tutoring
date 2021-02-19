import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/dependency_injection/service_locator.dart';
import 'features/auth/presentation/widgets/entry_point.dart';

/// Driver function
Future<void> main() async {
  // Initialize dependencies
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();

  // Run the app
  runApp(EntryPoint());
}
