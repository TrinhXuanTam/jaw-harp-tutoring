// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/authentication_screen/auth_screen_bloc.dart';
import 'package:jews_harp/features/auth/domain/use_cases/email_authentication.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart';
import 'package:jews_harp/features/auth/data/data_sources_impl/firebase_auth_local.dart';
import 'package:jews_harp/features/auth/data/data_sources_impl/firebase_auth_remote.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/BLoCs/hide_field_input/hide_field_input_bloc.dart';
import 'package:jews_harp/features/auth/data/data_source_interfaces/local/authentication_local.dart';
import 'package:jews_harp/features/auth/data/data_source_interfaces/remote/authentication_remote.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:jews_harp/features/auth/domain/use_cases/offline_authentication.dart';
import 'package:jews_harp/features/auth/domain/use_cases/sign_up.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart';
import 'package:jews_harp/features/auth/data/repositories/user_repository.dart';

/// Environment names
const _prod = 'prod';
const _dev = 'dev';
const _user_repository_test_env = 'user_repository_test_env';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<EmailVerificationBloc>(() => EmailVerificationBloc(),
      registerFor: {_prod, _dev});
  gh.factory<HideFieldInputBloc>(() => HideFieldInputBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<IAuthenticationLocalDataSource>(() => FirebaseAuthLocal(),
      registerFor: {_prod});
  gh.lazySingleton<IAuthenticationRemoteDataSource>(() => FirebaseAuthRemote(),
      registerFor: {_prod});
  gh.lazySingleton<IUserRepository>(
      () => UserRepository(get<IAuthenticationRemoteDataSource>(),
          get<IAuthenticationLocalDataSource>()),
      registerFor: {_prod, _user_repository_test_env});
  gh.lazySingleton<OfflineAuthentication>(
      () => OfflineAuthentication(get<IUserRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<SignUp>(() => SignUp(get<IUserRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<SignUpBloc>(() => SignUpBloc(get<SignUp>()),
      registerFor: {_prod, _dev});
  gh.factory<AuthBloc>(() => AuthBloc(get<OfflineAuthentication>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<EmailAuthentication>(
      () => EmailAuthentication(get<IUserRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<AuthScreenBloc>(() => AuthScreenBloc(get<EmailAuthentication>()),
      registerFor: {_prod, _dev});
  return get;
}
