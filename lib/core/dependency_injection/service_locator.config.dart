// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jews_harp/core/BLoCs/hide_field_input/hide_field_input_bloc.dart'
    as _i5;
import 'package:jews_harp/core/BLoCs/toggle_switch/toggle_switch_bloc.dart'
    as _i23;
import 'package:jews_harp/features/admin/application/use_cases/create_category.dart'
    as _i25;
import 'package:jews_harp/features/admin/application/use_cases/get_all_categories.dart'
    as _i31;
import 'package:jews_harp/features/admin/application/use_cases/get_hidden_categories.dart'
    as _i34;
import 'package:jews_harp/features/admin/application/use_cases/get_visible_categories.dart'
    as _i35;
import 'package:jews_harp/features/admin/application/use_cases/pick_image.dart'
    as _i16;
import 'package:jews_harp/features/admin/application/use_cases/pick_video.dart'
    as _i17;
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart'
    as _i6;
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart'
    as _i3;
import 'package:jews_harp/features/admin/infrastructure/repositories/category_admin_repository.dart'
    as _i7;
import 'package:jews_harp/features/admin/presentation/BLoCs/admin_menu/admin_menu_bloc.dart'
    as _i39;
import 'package:jews_harp/features/admin/presentation/BLoCs/create_category/create_category_bloc.dart'
    as _i26;
import 'package:jews_harp/features/admin/presentation/BLoCs/create_technique/create_technique_bloc.dart'
    as _i41;
import 'package:jews_harp/features/admin/presentation/BLoCs/thumbnail_picker/thumbnail_picker_bloc.dart'
    as _i22;
import 'package:jews_harp/features/admin/presentation/BLoCs/video_picker/video_picker_bloc.dart'
    as _i24;
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart'
    as _i27;
import 'package:jews_harp/features/auth/application/use_cases/email_verification_check.dart'
    as _i28;
import 'package:jews_harp/features/auth/application/use_cases/facebook_authentication.dart'
    as _i30;
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart'
    as _i32;
import 'package:jews_harp/features/auth/application/use_cases/get_current_user.dart'
    as _i33;
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart'
    as _i36;
import 'package:jews_harp/features/auth/application/use_cases/link_email_provider.dart'
    as _i12;
import 'package:jews_harp/features/auth/application/use_cases/link_facebook_provider.dart'
    as _i13;
import 'package:jews_harp/features/auth/application/use_cases/password_reset.dart'
    as _i14;
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart'
    as _i18;
import 'package:jews_harp/features/auth/application/use_cases/set_locale.dart'
    as _i19;
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart'
    as _i20;
import 'package:jews_harp/features/auth/application/use_cases/sign_up.dart'
    as _i21;
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart'
    as _i8;
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart'
    as _i10;
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart'
    as _i4;
import 'package:jews_harp/features/auth/infrastructure/facades/user_facade.dart'
    as _i9;
import 'package:jews_harp/features/auth/infrastructure/repositories/user_repository.dart'
    as _i11;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_authentication/email_auth_bloc.dart'
    as _i42;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart'
    as _i29;
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart'
    as _i40;
import 'package:jews_harp/features/auth/presentation/BLoCs/password_reset/password_reset_bloc.dart'
    as _i15;
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart'
    as _i37;
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart'
    as _i38;

const String _prod = 'prod';
const String _dev = 'dev';
const String _user_repository_test_env = 'user_repository_test_env';
const String _link_email_provider_test_env = 'link_email_provider_test_env';
const String _link_facebook_provider_test_env =
    'link_facebook_provider_test_env';
const String _password_reset_test_env = 'password_reset_test_env';
const String _send_email_verification_test_env =
    'send_email_verification_test_env';
const String _sign_up_test_env = 'sign_up_test_env';
const String _email_authentication_test_env = 'email_authentication_test_env';
const String _email_verification_check_test_env =
    'email_verification_check_test_env';
const String _facebook_authentication_test_env =
    'facebook_authentication_test_env';
const String _get_authentication_providers_test_env =
    'get_authentication_providers_test_env';
const String _get_current_user_test_env = 'get_current_user_test_env';
const String _google_authentication_test_env = 'google_authentication_test_env';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.FirebaseAdminDataSource>(
      () => _i3.FirebaseAdminDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i4.FirebaseAuthDataSource>(
      () => _i4.FirebaseAuthDataSource(),
      registerFor: {_prod});
  gh.factory<_i5.HideFieldInputBloc>(() => _i5.HideFieldInputBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i6.ICategoryAdminRepository>(
      () => _i7.CategoryAdminRepository(get<_i3.FirebaseAdminDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i8.IUserFacade>(() => _i9.FirebaseAuthFacade(),
      registerFor: {_prod});
  gh.lazySingleton<_i10.IUserRepository>(
      () => _i11.UserRepository(get<_i4.FirebaseAuthDataSource>()),
      registerFor: {_prod, _user_repository_test_env});
  gh.lazySingleton<_i12.LinkEmailProvider>(
      () => _i12.LinkEmailProvider(get<_i8.IUserFacade>()),
      registerFor: {_prod, _dev, _link_email_provider_test_env});
  gh.lazySingleton<_i13.LinkFacebookProvider>(
      () => _i13.LinkFacebookProvider(get<_i8.IUserFacade>()),
      registerFor: {_prod, _dev, _link_facebook_provider_test_env});
  gh.lazySingleton<_i14.PasswordReset>(
      () => _i14.PasswordReset(get<_i8.IUserFacade>()),
      registerFor: {_prod, _dev, _password_reset_test_env});
  gh.factory<_i15.PasswordResetBloc>(
      () => _i15.PasswordResetBloc(get<_i14.PasswordReset>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i16.PickImage>(() => _i16.PickImage(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i17.PickVideo>(() => _i17.PickVideo(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i18.SendEmailVerification>(
      () => _i18.SendEmailVerification(get<_i8.IUserFacade>()),
      registerFor: {_prod, _dev, _send_email_verification_test_env});
  gh.lazySingleton<_i19.SetLocale>(
      () => _i19.SetLocale(get<_i8.IUserFacade>(), get<_i10.IUserRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i20.SignOut>(() => _i20.SignOut(get<_i8.IUserFacade>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i21.SignUp>(() => _i21.SignUp(get<_i10.IUserRepository>()),
      registerFor: {_prod, _dev, _sign_up_test_env});
  gh.factory<_i22.ThumbnailPickerBloc>(
      () => _i22.ThumbnailPickerBloc(get<_i16.PickImage>()),
      registerFor: {_prod, _dev});
  gh.factory<_i23.ToggleSwitchBloc>(() => _i23.ToggleSwitchBloc(),
      registerFor: {_prod, _dev});
  gh.factory<_i24.VideoPickerBloc>(
      () => _i24.VideoPickerBloc(get<_i17.PickVideo>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i25.CreateCategory>(
      () => _i25.CreateCategory(get<_i6.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i26.CreateCategoryBloc>(
      () => _i26.CreateCategoryBloc(get<_i25.CreateCategory>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i27.EmailAuthentication>(
      () => _i27.EmailAuthentication(get<_i10.IUserRepository>()),
      registerFor: {_prod, _dev, _email_authentication_test_env});
  gh.lazySingleton<_i28.EmailIsVerified>(
      () => _i28.EmailIsVerified(get<_i8.IUserFacade>()),
      registerFor: {_prod, _dev, _email_verification_check_test_env});
  gh.factory<_i29.EmailVerificationBloc>(
      () => _i29.EmailVerificationBloc(get<_i20.SignOut>(),
          get<_i18.SendEmailVerification>(), get<_i28.EmailIsVerified>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i30.FacebookAuthentication>(
      () => _i30.FacebookAuthentication(get<_i10.IUserRepository>()),
      registerFor: {_prod, _dev, _facebook_authentication_test_env});
  gh.lazySingleton<_i31.GetAllCategories>(
      () => _i31.GetAllCategories(get<_i6.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i32.GetAuthProviders>(
      () => _i32.GetAuthProviders(get<_i10.IUserRepository>()),
      registerFor: {_prod, _dev, _get_authentication_providers_test_env});
  gh.lazySingleton<_i33.GetCurrentUser>(
      () => _i33.GetCurrentUser(get<_i10.IUserRepository>()),
      registerFor: {_prod, _dev, _get_current_user_test_env});
  gh.lazySingleton<_i34.GetHiddenCategories>(
      () => _i34.GetHiddenCategories(get<_i6.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i35.GetVisibleCategories>(
      () => _i35.GetVisibleCategories(get<_i6.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i36.GoogleAuthentication>(
      () => _i36.GoogleAuthentication(get<_i10.IUserRepository>()),
      registerFor: {_prod, _dev, _google_authentication_test_env});
  gh.factory<_i37.SignUpBloc>(
      () => _i37.SignUpBloc(get<_i21.SignUp>(), get<_i32.GetAuthProviders>(),
          get<_i12.LinkEmailProvider>()),
      registerFor: {_prod, _dev});
  gh.factory<_i38.ThirdPartyAuthBloc>(
      () => _i38.ThirdPartyAuthBloc(
          get<_i30.FacebookAuthentication>(),
          get<_i36.GoogleAuthentication>(),
          get<_i32.GetAuthProviders>(),
          get<_i13.LinkFacebookProvider>()),
      registerFor: {_prod, _dev});
  gh.factory<_i39.AdminMenuBloc>(
      () => _i39.AdminMenuBloc(
          get<_i35.GetVisibleCategories>(), get<_i34.GetHiddenCategories>()),
      registerFor: {_prod, _dev});
  gh.factory<_i40.AuthBloc>(
      () => _i40.AuthBloc(
          get<_i33.GetCurrentUser>(),
          get<_i28.EmailIsVerified>(),
          get<_i19.SetLocale>(),
          get<_i20.SignOut>()),
      registerFor: {_prod, _dev});
  gh.factory<_i41.CreateTechniqueBloc>(
      () => _i41.CreateTechniqueBloc(get<_i31.GetAllCategories>()),
      registerFor: {_prod, _dev});
  gh.factory<_i42.EmailAuthBloc>(
      () => _i42.EmailAuthBloc(get<_i27.EmailAuthentication>()),
      registerFor: {_prod, _dev});
  return get;
}
