// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:jews_harp/features/auth/application/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/auth/application/BLoCs/authentication_screen/auth_screen_bloc.dart';
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart';
import 'package:jews_harp/features/auth/application/BLoCs/email_verification/email_verification_bloc.dart';
import 'package:jews_harp/features/auth/application/use_cases/facebook_authentication.dart';
import 'package:jews_harp/features/auth/infrastructure/data/data_sources/implementations/firebase_auth_local.dart';
import 'package:jews_harp/features/auth/infrastructure/data/data_sources/implementations/firebase_auth_remote.dart';
import 'package:jews_harp/features/auth/infrastructure/data/data_sources/implementations/firebase_third_party_auth.dart';
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart';
import 'package:jews_harp/core/BLoCs/hide_field_input/hide_field_input_bloc.dart';
import 'package:jews_harp/features/auth/infrastructure/data/data_sources/interfaces/local/authentication_local.dart';
import 'package:jews_harp/features/auth/infrastructure/data/data_sources/interfaces/remote/authentication_remote.dart';
import 'package:jews_harp/features/auth/infrastructure/data/data_sources/interfaces/remote/third_party_authentication.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:jews_harp/features/auth/application/use_cases/offline_authentication.dart';
import 'package:jews_harp/features/auth/application/use_cases/password_reset.dart';
import 'package:jews_harp/features/auth/application/BLoCs/password_reset/password_reset_bloc.dart';
import 'package:jews_harp/features/auth/application/use_cases/sign_up.dart';
import 'package:jews_harp/features/auth/application/BLoCs/sign_up_screen/sign_up_bloc.dart';
import 'package:jews_harp/features/auth/application/BLoCs/third_party_authentication/third_party_auth_bloc.dart';
import 'package:jews_harp/features/auth/infrastructure/data/repositories/user_repository.dart';

/// Environment names
const _prod = 'prod';
const _dev = 'dev';
const _user_repository_test_env = 'user_repository_test_env';
const _offline_authentication_test_env = 'offline_authentication_test_env';
const _sign_up_test_env = 'sign_up_test_env';
const _email_authentication_test_env = 'email_authentication_test_env';

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
  gh.lazySingleton<IThirdPartyAuthenticationDataSource>(
      () => FirebaseThirdPartyAuth(),
      registerFor: {_prod});
  gh.lazySingleton<IUserRepository>(
      () => UserRepository(
            get<IAuthenticationRemoteDataSource>(),
            get<IAuthenticationLocalDataSource>(),
            get<IThirdPartyAuthenticationDataSource>(),
          ),
      registerFor: {_prod, _user_repository_test_env});
  gh.lazySingleton<OfflineAuthentication>(
      () => OfflineAuthentication(get<IUserRepository>()),
      registerFor: {_prod, _dev, _offline_authentication_test_env});
  gh.lazySingleton<PasswordReset>(() => PasswordReset(get<IUserRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<PasswordResetBloc>(() => PasswordResetBloc(get<PasswordReset>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<SignUp>(() => SignUp(get<IUserRepository>()),
      registerFor: {_prod, _dev, _sign_up_test_env});
  gh.factory<AuthBloc>(() => AuthBloc(get<OfflineAuthentication>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<EmailAuthentication>(
      () => EmailAuthentication(get<IUserRepository>()),
      registerFor: {_prod, _dev, _email_authentication_test_env});
  gh.lazySingleton<FacebookAuthentication>(
      () => FacebookAuthentication(get<IUserRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<GetAuthProviders>(
      () => GetAuthProviders(get<IUserRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<GoogleAuthentication>(
      () => GoogleAuthentication(get<IUserRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<SignUpBloc>(
      () => SignUpBloc(get<SignUp>(), get<GetAuthProviders>()),
      registerFor: {_prod, _dev});
  gh.factory<ThirdPartyAuthBloc>(
      () => ThirdPartyAuthBloc(
          get<FacebookAuthentication>(), get<GoogleAuthentication>()),
      registerFor: {_prod, _dev});
  gh.factory<AuthScreenBloc>(() => AuthScreenBloc(get<EmailAuthentication>()),
      registerFor: {_prod, _dev});
  return get;
}
