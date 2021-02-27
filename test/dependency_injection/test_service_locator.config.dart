// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/email_authentication/email_auth_bloc.dart';
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart';
import 'package:jews_harp/features/auth/application/use_cases/email_verification_check.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart';
import 'package:jews_harp/features/auth/application/use_cases/facebook_authentication.dart';
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart';
import 'package:jews_harp/features/auth/infrastructure/facades/user_facade.dart';
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart';
import 'package:jews_harp/core/BLoCs/hide_field_input/hide_field_input_bloc.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:jews_harp/features/auth/application/use_cases/link_email_provider.dart';
import 'package:jews_harp/features/auth/application/use_cases/link_facebook_provider.dart';
import 'package:jews_harp/features/auth/application/use_cases/offline_authentication.dart';
import 'package:jews_harp/features/auth/application/use_cases/password_reset.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/password_reset/password_reset_bloc.dart';
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart';
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart';
import 'package:jews_harp/features/auth/application/use_cases/sign_up.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart';
import 'package:jews_harp/features/auth/infrastructure/repositories/user_repository.dart';

import 'mock.dart';

/// Environment names
const _user_repository_test_env = 'user_repository_test_env';
const _prod = 'prod';
const _dev = 'dev';
const _email_authentication_test_env = 'email_authentication_test_env';
const _offline_authentication_test_env = 'offline_authentication_test_env';
const _sign_up_test_env = 'sign_up_test_env';
const _email_verification_check_test_env = 'email_verification_check_test_env';
const _link_email_provider_test_env = 'link_email_provider_test_env';
const _link_facebook_provider_test_env = 'link_facebook_provider_test_env';
const _password_reset_test_env = 'password_reset_test_env';
const _send_email_verification_test_env = 'send_email_verification_test_env';
const _facebook_authentication_test_env = 'facebook_authentication_test_env';
const _google_authentication_test_env = 'google_authentication_test_env';
const _get_authentication_providers_test_env =
    'get_authentication_providers_test_env';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt testInitGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<FirebaseAuthDataSource>(() => FirebaseAuthDataSourceMock(),
      registerFor: {_user_repository_test_env});
  gh.lazySingleton<FirebaseAuthDataSource>(() => FirebaseAuthDataSource(),
      registerFor: {_prod});
  gh.factory<HideFieldInputBloc>(() => HideFieldInputBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<IUserFacade>(() => IUserFacadeMock(), registerFor: {
    _email_authentication_test_env,
    _offline_authentication_test_env,
    _sign_up_test_env,
    _email_verification_check_test_env,
    _link_email_provider_test_env,
    _link_facebook_provider_test_env,
    _password_reset_test_env,
    _send_email_verification_test_env
  });
  gh.lazySingleton<IUserFacade>(() => FirebaseAuthFacade(),
      registerFor: {_prod});
  gh.lazySingleton<IUserRepository>(() => IUserRepositoryMock(), registerFor: {
    _email_authentication_test_env,
    _offline_authentication_test_env,
    _sign_up_test_env,
    _facebook_authentication_test_env,
    _google_authentication_test_env,
    _get_authentication_providers_test_env
  });
  gh.lazySingleton<IUserRepository>(
      () => UserRepository(get<FirebaseAuthDataSource>()),
      registerFor: {_prod, _user_repository_test_env});
  gh.lazySingleton<LinkEmailProvider>(
      () => LinkEmailProvider(get<IUserFacade>()),
      registerFor: {_prod, _dev, _link_email_provider_test_env});
  gh.lazySingleton<LinkFacebookProvider>(
      () => LinkFacebookProvider(get<IUserFacade>()),
      registerFor: {_prod, _dev, _link_facebook_provider_test_env});
  gh.lazySingleton<OfflineAuthentication>(
      () => OfflineAuthentication(get<IUserRepository>()),
      registerFor: {_prod, _dev, _offline_authentication_test_env});
  gh.lazySingleton<PasswordReset>(() => PasswordReset(get<IUserFacade>()),
      registerFor: {_prod, _dev, _password_reset_test_env});
  gh.factory<PasswordResetBloc>(() => PasswordResetBloc(get<PasswordReset>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<SendEmailVerification>(
      () => SendEmailVerification(get<IUserFacade>()),
      registerFor: {_prod, _dev, _send_email_verification_test_env});
  gh.lazySingleton<SignOut>(() => SignOut(get<IUserFacade>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<SignUp>(() => SignUp(get<IUserRepository>()),
      registerFor: {_prod, _dev, _sign_up_test_env});
  gh.lazySingleton<EmailAuthentication>(
      () => EmailAuthentication(get<IUserRepository>()),
      registerFor: {_prod, _dev, _email_authentication_test_env});
  gh.lazySingleton<EmailIsVerified>(() => EmailIsVerified(get<IUserFacade>()),
      registerFor: {_prod, _dev, _email_verification_check_test_env});
  gh.factory<EmailVerificationBloc>(
      () => EmailVerificationBloc(
            get<SignOut>(),
            get<SendEmailVerification>(),
            get<EmailIsVerified>(),
          ),
      registerFor: {_prod, _dev});
  gh.lazySingleton<FacebookAuthentication>(
      () => FacebookAuthentication(get<IUserRepository>()),
      registerFor: {_prod, _dev, _facebook_authentication_test_env});
  gh.lazySingleton<GetAuthProviders>(
      () => GetAuthProviders(get<IUserRepository>()),
      registerFor: {_prod, _dev, _get_authentication_providers_test_env});
  gh.lazySingleton<GoogleAuthentication>(
      () => GoogleAuthentication(get<IUserRepository>()),
      registerFor: {_prod, _dev, _google_authentication_test_env});
  gh.factory<SignUpBloc>(
      () => SignUpBloc(
            get<SignUp>(),
            get<GetAuthProviders>(),
            get<LinkEmailProvider>(),
          ),
      registerFor: {_prod, _dev});
  gh.factory<ThirdPartyAuthBloc>(
      () => ThirdPartyAuthBloc(
            get<FacebookAuthentication>(),
            get<GoogleAuthentication>(),
            get<GetAuthProviders>(),
            get<LinkFacebookProvider>(),
          ),
      registerFor: {_prod, _dev});
  gh.factory<AuthBloc>(
      () => AuthBloc(
            get<OfflineAuthentication>(),
            get<EmailIsVerified>(),
            get<SignOut>(),
          ),
      registerFor: {_prod, _dev});
  gh.factory<EmailAuthBloc>(() => EmailAuthBloc(get<EmailAuthentication>()),
      registerFor: {_prod, _dev});
  return get;
}
