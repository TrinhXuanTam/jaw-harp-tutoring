// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import '../../features/auth/data/data_sources_impl/firebase_auth_local.dart';
import '../../features/auth/data/data_sources_impl/firebase_auth_remote.dart';
import '../../features/auth/data/data_source_interfaces/local/authentication_local.dart';
import '../../features/auth/data/data_source_interfaces/remote/authentication_remote.dart';
import '../../features/auth/domain/repository_interfaces/user_repository_interface.dart';
import '../../features/auth/domain/use_cases/offline_authentication.dart';
import '../../features/auth/data/repositories/user_repository.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<IAuthenticationLocalDataSource>(() => FirebaseAuthLocal());
  gh.lazySingleton<IAuthenticationRemoteDataSource>(() => FirebaseAuthRemote());
  gh.lazySingleton<IUserRepository>(() => UserRepository(
      get<IAuthenticationRemoteDataSource>(),
      get<IAuthenticationLocalDataSource>()));
  gh.lazySingleton<OfflineAuthentication>(
      () => OfflineAuthentication(get<IUserRepository>()));
  gh.factory<AuthBloc>(() => AuthBloc(get<OfflineAuthentication>()));
  return get;
}
