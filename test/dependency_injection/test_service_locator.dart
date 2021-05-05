import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';

import 'test_service_locator.config.dart';

@InjectableInit(
  initializerName: r'testInitGetIt',
  preferRelativeImports: true,
  asExtension: false,
  generateForDir: ["test", "lib"],
)
void testConfigureDependencies(String environment) => testInitGetIt(serviceLocator, environment: environment);
