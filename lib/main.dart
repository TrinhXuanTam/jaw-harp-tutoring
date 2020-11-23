import 'package:flutter/material.dart';

import 'package:jews_harp/core/config/Config.dart';

Future<void> main() async {
  await Config.initApp();
  runApp(Config.getEntryPoint());
}
