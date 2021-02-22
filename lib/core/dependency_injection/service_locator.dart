import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.config.dart';

final serviceLocator = GetIt.instance;

@InjectableInit(
  initializerName: r'initGetIt',
  preferRelativeImports: false,
  asExtension: false,
  generateForDir: ["lib"],
)
void configureDependencies() => initGetIt(serviceLocator, environment: Environment.prod);
