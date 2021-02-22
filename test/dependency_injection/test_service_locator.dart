import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'test_service_locator.config.dart';

final testServiceLocator = GetIt.instance;

@InjectableInit(
  initializerName: r'testInitGetIt',
  preferRelativeImports: true,
  asExtension: false,
  generateForDir: ["test", "lib"],
)
void testConfigureDependencies(String environment) => testInitGetIt(testServiceLocator, environment: environment);
