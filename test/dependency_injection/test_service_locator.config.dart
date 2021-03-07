// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jews_harp/core/BLoCs/hide_field_input/hide_field_input_bloc.dart'
    as _i7;
import 'package:jews_harp/core/BLoCs/toggle_switch/toggle_switch_bloc.dart'
    as _i25;
import 'package:jews_harp/features/admin/application/use_cases/create_category.dart'
    as _i27;
import 'package:jews_harp/features/admin/application/use_cases/get_hidden_categories.dart'
    as _i35;
import 'package:jews_harp/features/admin/application/use_cases/get_visible_categories.dart'
    as _i36;
import 'package:jews_harp/features/admin/application/use_cases/pick_image.dart'
    as _i18;
import 'package:jews_harp/features/admin/application/use_cases/pick_video.dart'
    as _i19;
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart'
    as _i8;
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart'
    as _i4;
import 'package:jews_harp/features/admin/infrastructure/repositories/category_admin_repository.dart'
    as _i9;
import 'package:jews_harp/features/admin/presentation/BLoCs/admin_menu/admin_menu_bloc.dart'
    as _i40;
import 'package:jews_harp/features/admin/presentation/BLoCs/create_category/create_category_bloc.dart'
    as _i28;
import 'package:jews_harp/features/admin/presentation/BLoCs/create_technique/create_technique_bloc.dart'
    as _i3;
import 'package:jews_harp/features/admin/presentation/BLoCs/thumbnail_picker/thumbnail_picker_bloc.dart'
    as _i24;
import 'package:jews_harp/features/admin/presentation/BLoCs/video_picker/video_picker_bloc.dart'
    as _i26;
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart'
    as _i29;
import 'package:jews_harp/features/auth/application/use_cases/email_verification_check.dart'
    as _i30;
import 'package:jews_harp/features/auth/application/use_cases/facebook_authentication.dart'
    as _i32;
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart'
    as _i33;
import 'package:jews_harp/features/auth/application/use_cases/get_current_user.dart'
    as _i34;
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart'
    as _i37;
import 'package:jews_harp/features/auth/application/use_cases/link_email_provider.dart'
    as _i14;
import 'package:jews_harp/features/auth/application/use_cases/link_facebook_provider.dart'
    as _i15;
import 'package:jews_harp/features/auth/application/use_cases/password_reset.dart'
    as _i16;
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart'
    as _i20;
import 'package:jews_harp/features/auth/application/use_cases/set_locale.dart'
    as _i21;
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart'
    as _i22;
import 'package:jews_harp/features/auth/application/use_cases/sign_up.dart'
    as _i23;
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart'
    as _i10;
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart'
    as _i12;
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart'
    as _i5;
import 'package:jews_harp/features/auth/infrastructure/facades/user_facade.dart'
    as _i11;
import 'package:jews_harp/features/auth/infrastructure/repositories/user_repository.dart'
    as _i13;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_authentication/email_auth_bloc.dart'
    as _i42;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart'
    as _i31;
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart'
    as _i41;
import 'package:jews_harp/features/auth/presentation/BLoCs/password_reset/password_reset_bloc.dart'
    as _i17;
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart'
    as _i38;
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart'
    as _i39;

import 'mock.dart' as _i6;

const String _prod = 'prod';
const String _dev = 'dev';
const String _user_repository_test_env = 'user_repository_test_env';
const String _email_authentication_test_env = 'email_authentication_test_env';
const String _get_current_user_test_env = 'get_current_user_test_env';
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
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.CreateTechniqueBloc>(() => _i3.CreateTechniqueBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i4.FirebaseAdminDataSource>(
      () => _i4.FirebaseAdminDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i5.FirebaseAuthDataSource>(
      () => _i6.FirebaseAuthDataSourceMock(),
      registerFor: {_user_repository_test_env});
  gh.lazySingleton<_i5.FirebaseAuthDataSource>(
      () => _i5.FirebaseAuthDataSource(),
      registerFor: {_prod});
  gh.factory<_i7.HideFieldInputBloc>(() => _i7.HideFieldInputBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i8.ICategoryAdminRepository>(
      () => _i9.CategoryAdminRepository(get<_i4.FirebaseAdminDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i10.IUserFacade>(() => _i6.IUserFacadeMock(), registerFor: {
    _email_authentication_test_env,
    _get_current_user_test_env,
    _sign_up_test_env,
    _email_verification_check_test_env,
    _link_email_provider_test_env,
    _link_facebook_provider_test_env,
    _password_reset_test_env,
    _send_email_verification_test_env
  });
  gh.lazySingleton<_i10.IUserFacade>(() => _i11.FirebaseAuthFacade(),
      registerFor: {_prod});
  gh.lazySingleton<_i12.IUserRepository>(() => _i6.IUserRepositoryMock(),
      registerFor: {
        _email_authentication_test_env,
        _get_current_user_test_env,
        _sign_up_test_env,
        _facebook_authentication_test_env,
        _google_authentication_test_env,
        _get_authentication_providers_test_env
      });
  gh.lazySingleton<_i12.IUserRepository>(
      () => _i13.UserRepository(get<_i5.FirebaseAuthDataSource>()),
      registerFor: {_prod, _user_repository_test_env});
  gh.lazySingleton<_i14.LinkEmailProvider>(
      () => _i14.LinkEmailProvider(get<_i10.IUserFacade>()),
      registerFor: {_prod, _dev, _link_email_provider_test_env});
  gh.lazySingleton<_i15.LinkFacebookProvider>(
      () => _i15.LinkFacebookProvider(get<_i10.IUserFacade>()),
      registerFor: {_prod, _dev, _link_facebook_provider_test_env});
  gh.lazySingleton<_i16.PasswordReset>(
      () => _i16.PasswordReset(get<_i10.IUserFacade>()),
      registerFor: {_prod, _dev, _password_reset_test_env});
  gh.factory<_i17.PasswordResetBloc>(
      () => _i17.PasswordResetBloc(get<_i16.PasswordReset>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i18.PickImage>(() => _i18.PickImage(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i19.PickVideo>(() => _i19.PickVideo(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i20.SendEmailVerification>(
      () => _i20.SendEmailVerification(get<_i10.IUserFacade>()),
      registerFor: {_prod, _dev, _send_email_verification_test_env});
  gh.lazySingleton<_i21.SetLocale>(
      () =>
          _i21.SetLocale(get<_i10.IUserFacade>(), get<_i12.IUserRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i22.SignOut>(() => _i22.SignOut(get<_i10.IUserFacade>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i23.SignUp>(() => _i23.SignUp(get<_i12.IUserRepository>()),
      registerFor: {_prod, _dev, _sign_up_test_env});
  gh.factory<_i24.ThumbnailPickerBloc>(
      () => _i24.ThumbnailPickerBloc(get<_i18.PickImage>()),
      registerFor: {_prod, _dev});
  gh.factory<_i25.ToggleSwitchBloc>(() => _i25.ToggleSwitchBloc(),
      registerFor: {_prod, _dev});
  gh.factory<_i26.VideoPickerBloc>(
      () => _i26.VideoPickerBloc(get<_i19.PickVideo>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i27.CreateCategory>(
      () => _i27.CreateCategory(get<_i8.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i28.CreateCategoryBloc>(
      () => _i28.CreateCategoryBloc(get<_i27.CreateCategory>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i29.EmailAuthentication>(
      () => _i29.EmailAuthentication(get<_i12.IUserRepository>()),
      registerFor: {_prod, _dev, _email_authentication_test_env});
  gh.lazySingleton<_i30.EmailIsVerified>(
      () => _i30.EmailIsVerified(get<_i10.IUserFacade>()),
      registerFor: {_prod, _dev, _email_verification_check_test_env});
  gh.factory<_i31.EmailVerificationBloc>(
      () => _i31.EmailVerificationBloc(get<_i22.SignOut>(),
          get<_i20.SendEmailVerification>(), get<_i30.EmailIsVerified>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i32.FacebookAuthentication>(
      () => _i32.FacebookAuthentication(get<_i12.IUserRepository>()),
      registerFor: {_prod, _dev, _facebook_authentication_test_env});
  gh.lazySingleton<_i33.GetAuthProviders>(
      () => _i33.GetAuthProviders(get<_i12.IUserRepository>()),
      registerFor: {_prod, _dev, _get_authentication_providers_test_env});
  gh.lazySingleton<_i34.GetCurrentUser>(
      () => _i34.GetCurrentUser(get<_i12.IUserRepository>()),
      registerFor: {_prod, _dev, _get_current_user_test_env});
  gh.lazySingleton<_i35.GetHiddenCategories>(
      () => _i35.GetHiddenCategories(get<_i8.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i36.GetVisibleCategories>(
      () => _i36.GetVisibleCategories(get<_i8.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i37.GoogleAuthentication>(
      () => _i37.GoogleAuthentication(get<_i12.IUserRepository>()),
      registerFor: {_prod, _dev, _google_authentication_test_env});
  gh.factory<_i38.SignUpBloc>(
      () => _i38.SignUpBloc(get<_i23.SignUp>(), get<_i33.GetAuthProviders>(),
          get<_i14.LinkEmailProvider>()),
      registerFor: {_prod, _dev});
  gh.factory<_i39.ThirdPartyAuthBloc>(
      () => _i39.ThirdPartyAuthBloc(
          get<_i32.FacebookAuthentication>(),
          get<_i37.GoogleAuthentication>(),
          get<_i33.GetAuthProviders>(),
          get<_i15.LinkFacebookProvider>()),
      registerFor: {_prod, _dev});
  gh.factory<_i40.AdminMenuBloc>(
      () => _i40.AdminMenuBloc(
          get<_i36.GetVisibleCategories>(), get<_i35.GetHiddenCategories>()),
      registerFor: {_prod, _dev});
  gh.factory<_i41.AuthBloc>(
      () => _i41.AuthBloc(
          get<_i34.GetCurrentUser>(),
          get<_i30.EmailIsVerified>(),
          get<_i21.SetLocale>(),
          get<_i22.SignOut>()),
      registerFor: {_prod, _dev});
  gh.factory<_i42.EmailAuthBloc>(
      () => _i42.EmailAuthBloc(get<_i29.EmailAuthentication>()),
      registerFor: {_prod, _dev});
  return get;
}
