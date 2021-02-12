import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.config.dart';

final serviceLocator = GetIt.instance;

@InjectableInit(
  initializerName: r'initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => initGetIt(serviceLocator);
