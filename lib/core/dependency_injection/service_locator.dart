import 'package:get_it/get_it.dart';

import 'package:jews_harp/features/auth/data/repositories/user_repository.dart';
import 'package:jews_harp/features/auth/data/data_sources/firebase_data_source.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:jews_harp/features/auth/data/data_source_interfaces/local/authentication_local.dart';
import 'package:jews_harp/features/auth/data/data_source_interfaces/remote/authentication_remote.dart';
import 'package:jews_harp/features/auth/domain/use_cases/offline_authentication.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/auth_bloc.dart';

final dependencyInjectionContainer = GetIt.instance;

Future<void> registerDataSources() async {
  dependencyInjectionContainer.registerLazySingleton<IAuthenticationLocalDataSource>(() => FirebaseDataSource());
  dependencyInjectionContainer.registerLazySingleton<IAuthenticationRemoteDataSource>(() => FirebaseDataSource());
}

Future<void> registerRepositories() async {
  dependencyInjectionContainer.registerLazySingleton<IUserRepository>(() => UserRepository(dependencyInjectionContainer(), dependencyInjectionContainer()));
}

Future<void> registerUseCases() async {
  dependencyInjectionContainer.registerLazySingleton<OfflineAuthentication>(() => OfflineAuthentication(dependencyInjectionContainer()));
}

Future<void> registerBLoCs() async {
  dependencyInjectionContainer.registerFactory<AuthBloc>(() => AuthBloc(dependencyInjectionContainer()));
}

Future<void> initServiceLocator() async {
  registerDataSources();
  registerRepositories();
  registerUseCases();
}
