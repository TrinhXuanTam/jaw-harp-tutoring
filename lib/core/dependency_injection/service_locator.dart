import 'package:get_it/get_it.dart';

import 'package:jews_harp/features/login/data/repositories/user_repository.dart';
import 'package:jews_harp/features/login/data/data_sources/firebase_data_source.dart';
import 'package:jews_harp/features/login/domain/repository_interfaces/user_repository_interface.dart';
import 'package:jews_harp/features/login/data/data_source_interfaces/local/authentication_local.dart';
import 'package:jews_harp/features/login/data/data_source_interfaces/remote/authentication_remote.dart';

final serviceLocator = GetIt.instance;

Future<void> registerDataSources() async {
  serviceLocator.registerLazySingleton<IAuthenticationLocalDataSource>(() => FirebaseDataSource());
  serviceLocator.registerLazySingleton<IAuthenticationRemoteDataSource>(() => FirebaseDataSource());
}

Future<void> registerRepositories() async {
  serviceLocator.registerLazySingleton<IUserRepository>(() => UserRepository(serviceLocator(), serviceLocator()));
}

Future<void> initServiceLocator() async {
  registerDataSources();
  registerRepositories();
}
