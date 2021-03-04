// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jews_harp/core/BLoCs/hide_field_input/hide_field_input_bloc.dart'
    as _i6;
import 'package:jews_harp/core/BLoCs/toggle_switch/toggle_switch_bloc.dart'
    as _i21;
import 'package:jews_harp/features/admin/application/use_cases/create_category.dart'
    as _i22;
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart'
    as _i7;
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart'
    as _i3;
import 'package:jews_harp/features/admin/infrastructure/repositories/category_admin_repository.dart'
    as _i8;
import 'package:jews_harp/features/admin/presentation/BLoCs/create_category/create_category_bloc.dart'
    as _i23;
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart'
    as _i24;
import 'package:jews_harp/features/auth/application/use_cases/email_verification_check.dart'
    as _i25;
import 'package:jews_harp/features/auth/application/use_cases/facebook_authentication.dart'
    as _i27;
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart'
    as _i28;
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart'
    as _i29;
import 'package:jews_harp/features/auth/application/use_cases/link_email_provider.dart'
    as _i13;
import 'package:jews_harp/features/auth/application/use_cases/link_facebook_provider.dart'
    as _i14;
import 'package:jews_harp/features/auth/application/use_cases/offline_authentication.dart'
    as _i15;
import 'package:jews_harp/features/auth/application/use_cases/password_reset.dart'
    as _i16;
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart'
    as _i18;
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart'
    as _i19;
import 'package:jews_harp/features/auth/application/use_cases/sign_up.dart'
    as _i20;
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart'
    as _i9;
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart'
    as _i11;
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart'
    as _i4;
import 'package:jews_harp/features/auth/infrastructure/facades/user_facade.dart'
    as _i10;
import 'package:jews_harp/features/auth/infrastructure/repositories/user_repository.dart'
    as _i12;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_authentication/email_auth_bloc.dart'
    as _i33;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart'
    as _i26;
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart'
    as _i32;
import 'package:jews_harp/features/auth/presentation/BLoCs/password_reset/password_reset_bloc.dart'
    as _i17;
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart'
    as _i30;
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart'
    as _i31;

import 'mock.dart' as _i5;

const String _prod = 'prod';
const String _user_repository_test_env = 'user_repository_test_env';
const String _dev = 'dev';
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
  gh.lazySingleton<_i3.FirebaseAdminDataSource>(
      () => _i3.FirebaseAdminDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i4.FirebaseAuthDataSource>(
      () => _i5.FirebaseAuthDataSourceMock(),
      registerFor: {_user_repository_test_env});
  gh.lazySingleton<_i4.FirebaseAuthDataSource>(
      () => _i4.FirebaseAuthDataSource(),
      registerFor: {_prod});
  gh.factory<_i6.HideFieldInputBloc>(() => _i6.HideFieldInputBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i7.ICategoryAdminRepository>(
      () => _i8.CategoryAdminRepository(get<_i3.FirebaseAdminDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i9.IUserFacade>(() => _i5.IUserFacadeMock(), registerFor: {
    _email_authentication_test_env,
    _offline_authentication_test_env,
    _sign_up_test_env,
    _email_verification_check_test_env,
    _link_email_provider_test_env,
    _link_facebook_provider_test_env,
    _password_reset_test_env,
    _send_email_verification_test_env
  });
  gh.lazySingleton<_i9.IUserFacade>(() => _i10.FirebaseAuthFacade(),
      registerFor: {_prod});
  gh.lazySingleton<_i11.IUserRepository>(() => _i5.IUserRepositoryMock(),
      registerFor: {
        _email_authentication_test_env,
        _offline_authentication_test_env,
        _sign_up_test_env,
        _facebook_authentication_test_env,
        _google_authentication_test_env,
        _get_authentication_providers_test_env
      });
  gh.lazySingleton<_i11.IUserRepository>(
      () => _i12.UserRepository(get<_i4.FirebaseAuthDataSource>()),
      registerFor: {_prod, _user_repository_test_env});
  gh.lazySingleton<_i13.LinkEmailProvider>(
      () => _i13.LinkEmailProvider(get<_i9.IUserFacade>()),
      registerFor: {_prod, _dev, _link_email_provider_test_env});
  gh.lazySingleton<_i14.LinkFacebookProvider>(
      () => _i14.LinkFacebookProvider(get<_i9.IUserFacade>()),
      registerFor: {_prod, _dev, _link_facebook_provider_test_env});
  gh.lazySingleton<_i15.OfflineAuthentication>(
      () => _i15.OfflineAuthentication(get<_i11.IUserRepository>()),
      registerFor: {_prod, _dev, _offline_authentication_test_env});
  gh.lazySingleton<_i16.PasswordReset>(
      () => _i16.PasswordReset(get<_i9.IUserFacade>()),
      registerFor: {_prod, _dev, _password_reset_test_env});
  gh.factory<_i17.PasswordResetBloc>(
      () => _i17.PasswordResetBloc(get<_i16.PasswordReset>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i18.SendEmailVerification>(
      () => _i18.SendEmailVerification(get<_i9.IUserFacade>()),
      registerFor: {_prod, _dev, _send_email_verification_test_env});
  gh.lazySingleton<_i19.SignOut>(() => _i19.SignOut(get<_i9.IUserFacade>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i20.SignUp>(() => _i20.SignUp(get<_i11.IUserRepository>()),
      registerFor: {_prod, _dev, _sign_up_test_env});
  gh.factory<_i21.ToggleSwitchBloc>(() => _i21.ToggleSwitchBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i22.CreateCategory>(
      () => _i22.CreateCategory(get<_i7.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i23.CreateCategoryBloc>(
      () => _i23.CreateCategoryBloc(get<_i22.CreateCategory>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i24.EmailAuthentication>(
      () => _i24.EmailAuthentication(get<_i11.IUserRepository>()),
      registerFor: {_prod, _dev, _email_authentication_test_env});
  gh.lazySingleton<_i25.EmailIsVerified>(
      () => _i25.EmailIsVerified(get<_i9.IUserFacade>()),
      registerFor: {_prod, _dev, _email_verification_check_test_env});
  gh.factory<_i26.EmailVerificationBloc>(
      () => _i26.EmailVerificationBloc(get<_i19.SignOut>(),
          get<_i18.SendEmailVerification>(), get<_i25.EmailIsVerified>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i27.FacebookAuthentication>(
      () => _i27.FacebookAuthentication(get<_i11.IUserRepository>()),
      registerFor: {_prod, _dev, _facebook_authentication_test_env});
  gh.lazySingleton<_i28.GetAuthProviders>(
      () => _i28.GetAuthProviders(get<_i11.IUserRepository>()),
      registerFor: {_prod, _dev, _get_authentication_providers_test_env});
  gh.lazySingleton<_i29.GoogleAuthentication>(
      () => _i29.GoogleAuthentication(get<_i11.IUserRepository>()),
      registerFor: {_prod, _dev, _google_authentication_test_env});
  gh.factory<_i30.SignUpBloc>(
      () => _i30.SignUpBloc(get<_i20.SignUp>(), get<_i28.GetAuthProviders>(),
          get<_i13.LinkEmailProvider>()),
      registerFor: {_prod, _dev});
  gh.factory<_i31.ThirdPartyAuthBloc>(
      () => _i31.ThirdPartyAuthBloc(
          get<_i27.FacebookAuthentication>(),
          get<_i29.GoogleAuthentication>(),
          get<_i28.GetAuthProviders>(),
          get<_i14.LinkFacebookProvider>()),
      registerFor: {_prod, _dev});
  gh.factory<_i32.AuthBloc>(
      () => _i32.AuthBloc(get<_i15.OfflineAuthentication>(),
          get<_i25.EmailIsVerified>(), get<_i19.SignOut>()),
      registerFor: {_prod, _dev});
  gh.factory<_i33.EmailAuthBloc>(
      () => _i33.EmailAuthBloc(get<_i24.EmailAuthentication>()),
      registerFor: {_prod, _dev});
  return get;
}
