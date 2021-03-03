// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jews_harp/core/BLoCs/hide_field_input/hide_field_input_bloc.dart'
    as _i6;
import 'package:jews_harp/core/BLoCs/toggle_switch/toggle_switch_bloc.dart'
    as _i19;
import 'package:jews_harp/features/admin/presentation/BLoCs/create_category/create_category_bloc.dart'
    as _i3;
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart'
    as _i20;
import 'package:jews_harp/features/auth/application/use_cases/email_verification_check.dart'
    as _i21;
import 'package:jews_harp/features/auth/application/use_cases/facebook_authentication.dart'
    as _i23;
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart'
    as _i24;
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart'
    as _i25;
import 'package:jews_harp/features/auth/application/use_cases/link_email_provider.dart'
    as _i11;
import 'package:jews_harp/features/auth/application/use_cases/link_facebook_provider.dart'
    as _i12;
import 'package:jews_harp/features/auth/application/use_cases/offline_authentication.dart'
    as _i13;
import 'package:jews_harp/features/auth/application/use_cases/password_reset.dart'
    as _i14;
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart'
    as _i16;
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart'
    as _i17;
import 'package:jews_harp/features/auth/application/use_cases/sign_up.dart'
    as _i18;
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart'
    as _i7;
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart'
    as _i9;
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart'
    as _i4;
import 'package:jews_harp/features/auth/infrastructure/facades/user_facade.dart'
    as _i8;
import 'package:jews_harp/features/auth/infrastructure/repositories/user_repository.dart'
    as _i10;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_authentication/email_auth_bloc.dart'
    as _i29;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart'
    as _i22;
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart'
    as _i28;
import 'package:jews_harp/features/auth/presentation/BLoCs/password_reset/password_reset_bloc.dart'
    as _i15;
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart'
    as _i26;
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart'
    as _i27;

import 'mock.dart' as _i5;

const String _prod = 'prod';
const String _dev = 'dev';
const String _user_repository_test_env = 'user_repository_test_env';
const String _email_authentication_test_env = 'email_authentication_test_env';
const String _offline_authentication_test_env =
    'offline_authentication_test_env';
const String _sign_up_test_env = 'sign_up_test_env';
const String _email_verification_check_test_env =
    'email_verification_check_test_env';
const String _link_email_provider_test_env = 'link_email_provider_test_env';
const String _link_facebook_provider_test_env =
    'link_facebook_provider_test_env';
const String _password_reset_test_env = 'password_reset_test_env';
const String _send_email_verification_test_env =
    'send_email_verification_test_env';
const String _facebook_authentication_test_env =
    'facebook_authentication_test_env';
const String _google_authentication_test_env = 'google_authentication_test_env';
const String _get_authentication_providers_test_env =
    'get_authentication_providers_test_env';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt testInitGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.CreateCategoryBloc>(() => _i3.CreateCategoryBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i4.FirebaseAuthDataSource>(
      () => _i5.FirebaseAuthDataSourceMock(),
      registerFor: {_user_repository_test_env});
  gh.lazySingleton<_i4.FirebaseAuthDataSource>(
      () => _i4.FirebaseAuthDataSource(),
      registerFor: {_prod});
  gh.factory<_i6.HideFieldInputBloc>(() => _i6.HideFieldInputBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i7.IUserFacade>(() => _i5.IUserFacadeMock(), registerFor: {
    _email_authentication_test_env,
    _offline_authentication_test_env,
    _sign_up_test_env,
    _email_verification_check_test_env,
    _link_email_provider_test_env,
    _link_facebook_provider_test_env,
    _password_reset_test_env,
    _send_email_verification_test_env
  });
  gh.lazySingleton<_i7.IUserFacade>(() => _i8.FirebaseAuthFacade(),
      registerFor: {_prod});
  gh.lazySingleton<_i9.IUserRepository>(() => _i5.IUserRepositoryMock(),
      registerFor: {
        _email_authentication_test_env,
        _offline_authentication_test_env,
        _sign_up_test_env,
        _facebook_authentication_test_env,
        _google_authentication_test_env,
        _get_authentication_providers_test_env
      });
  gh.lazySingleton<_i9.IUserRepository>(
      () => _i10.UserRepository(get<_i4.FirebaseAuthDataSource>()),
      registerFor: {_prod, _user_repository_test_env});
  gh.lazySingleton<_i11.LinkEmailProvider>(
      () => _i11.LinkEmailProvider(get<_i7.IUserFacade>()),
      registerFor: {_prod, _dev, _link_email_provider_test_env});
  gh.lazySingleton<_i12.LinkFacebookProvider>(
      () => _i12.LinkFacebookProvider(get<_i7.IUserFacade>()),
      registerFor: {_prod, _dev, _link_facebook_provider_test_env});
  gh.lazySingleton<_i13.OfflineAuthentication>(
      () => _i13.OfflineAuthentication(get<_i9.IUserRepository>()),
      registerFor: {_prod, _dev, _offline_authentication_test_env});
  gh.lazySingleton<_i14.PasswordReset>(
      () => _i14.PasswordReset(get<_i7.IUserFacade>()),
      registerFor: {_prod, _dev, _password_reset_test_env});
  gh.factory<_i15.PasswordResetBloc>(
      () => _i15.PasswordResetBloc(get<_i14.PasswordReset>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i16.SendEmailVerification>(
      () => _i16.SendEmailVerification(get<_i7.IUserFacade>()),
      registerFor: {_prod, _dev, _send_email_verification_test_env});
  gh.lazySingleton<_i17.SignOut>(() => _i17.SignOut(get<_i7.IUserFacade>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i18.SignUp>(() => _i18.SignUp(get<_i9.IUserRepository>()),
      registerFor: {_prod, _dev, _sign_up_test_env});
  gh.factory<_i19.ToggleSwitchBloc>(() => _i19.ToggleSwitchBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i20.EmailAuthentication>(
      () => _i20.EmailAuthentication(get<_i9.IUserRepository>()),
      registerFor: {_prod, _dev, _email_authentication_test_env});
  gh.lazySingleton<_i21.EmailIsVerified>(
      () => _i21.EmailIsVerified(get<_i7.IUserFacade>()),
      registerFor: {_prod, _dev, _email_verification_check_test_env});
  gh.factory<_i22.EmailVerificationBloc>(
      () => _i22.EmailVerificationBloc(get<_i17.SignOut>(),
          get<_i16.SendEmailVerification>(), get<_i21.EmailIsVerified>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i23.FacebookAuthentication>(
      () => _i23.FacebookAuthentication(get<_i9.IUserRepository>()),
      registerFor: {_prod, _dev, _facebook_authentication_test_env});
  gh.lazySingleton<_i24.GetAuthProviders>(
      () => _i24.GetAuthProviders(get<_i9.IUserRepository>()),
      registerFor: {_prod, _dev, _get_authentication_providers_test_env});
  gh.lazySingleton<_i25.GoogleAuthentication>(
      () => _i25.GoogleAuthentication(get<_i9.IUserRepository>()),
      registerFor: {_prod, _dev, _google_authentication_test_env});
  gh.factory<_i26.SignUpBloc>(
      () => _i26.SignUpBloc(get<_i18.SignUp>(), get<_i24.GetAuthProviders>(),
          get<_i11.LinkEmailProvider>()),
      registerFor: {_prod, _dev});
  gh.factory<_i27.ThirdPartyAuthBloc>(
      () => _i27.ThirdPartyAuthBloc(
          get<_i23.FacebookAuthentication>(),
          get<_i25.GoogleAuthentication>(),
          get<_i24.GetAuthProviders>(),
          get<_i12.LinkFacebookProvider>()),
      registerFor: {_prod, _dev});
  gh.factory<_i28.AuthBloc>(
      () => _i28.AuthBloc(get<_i13.OfflineAuthentication>(),
          get<_i21.EmailIsVerified>(), get<_i17.SignOut>()),
      registerFor: {_prod, _dev});
  gh.factory<_i29.EmailAuthBloc>(
      () => _i29.EmailAuthBloc(get<_i20.EmailAuthentication>()),
      registerFor: {_prod, _dev});
  return get;
}
