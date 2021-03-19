// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jews_harp/core/BLoCs/errors/error_bloc.dart' as _i3;
import 'package:jews_harp/core/BLoCs/hide_field_input/hide_field_input_bloc.dart'
    as _i7;
import 'package:jews_harp/core/BLoCs/toggle_switch/toggle_switch_bloc.dart'
    as _i29;
import 'package:jews_harp/features/admin/application/use_cases/create_category.dart'
    as _i33;
import 'package:jews_harp/features/admin/application/use_cases/create_technique.dart'
    as _i34;
import 'package:jews_harp/features/admin/application/use_cases/get_all_categories.dart'
    as _i38;
import 'package:jews_harp/features/admin/application/use_cases/get_all_techniques.dart'
    as _i39;
import 'package:jews_harp/features/admin/application/use_cases/get_hidden_categories.dart'
    as _i42;
import 'package:jews_harp/features/admin/application/use_cases/get_techniques_by_category.dart'
    as _i43;
import 'package:jews_harp/features/admin/application/use_cases/pick_image.dart'
    as _i22;
import 'package:jews_harp/features/admin/application/use_cases/pick_video.dart'
    as _i23;
import 'package:jews_harp/features/admin/application/use_cases/update_category.dart'
    as _i30;
import 'package:jews_harp/features/admin/application/use_cases/update_technique.dart'
    as _i31;
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart'
    as _i8;
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart'
    as _i12;
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart'
    as _i4;
import 'package:jews_harp/features/admin/infrastructure/repositories/category_admin_repository.dart'
    as _i9;
import 'package:jews_harp/features/admin/infrastructure/repositories/technique_admin_repository.dart'
    as _i13;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_detail/category_detail_bloc.dart'
    as _i52;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart'
    as _i53;
import 'package:jews_harp/features/admin/presentation/BLoCs/hidden_categories/hidden_categories_bloc.dart'
    as _i46;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_form/technique_form_bloc.dart'
    as _i47;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_list/technique_list_bloc.dart'
    as _i48;
import 'package:jews_harp/features/admin/presentation/BLoCs/thumbnail_picker/thumbnail_picker_bloc.dart'
    as _i28;
import 'package:jews_harp/features/admin/presentation/BLoCs/video_picker/video_picker_bloc.dart'
    as _i32;
import 'package:jews_harp/features/admin/presentation/BLoCs/visible_categories/visible_categories_bloc.dart'
    as _i50;
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart'
    as _i35;
import 'package:jews_harp/features/auth/application/use_cases/email_verification_check.dart'
    as _i36;
import 'package:jews_harp/features/auth/application/use_cases/facebook_authentication.dart'
    as _i37;
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart'
    as _i40;
import 'package:jews_harp/features/auth/application/use_cases/get_current_user.dart'
    as _i41;
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart'
    as _i45;
import 'package:jews_harp/features/auth/application/use_cases/link_email_provider.dart'
    as _i18;
import 'package:jews_harp/features/auth/application/use_cases/link_facebook_provider.dart'
    as _i19;
import 'package:jews_harp/features/auth/application/use_cases/password_reset.dart'
    as _i20;
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart'
    as _i24;
import 'package:jews_harp/features/auth/application/use_cases/set_locale.dart'
    as _i25;
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart'
    as _i26;
import 'package:jews_harp/features/auth/application/use_cases/sign_up.dart'
    as _i27;
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart'
    as _i14;
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart'
    as _i16;
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart'
    as _i5;
import 'package:jews_harp/features/auth/infrastructure/facades/user_facade.dart'
    as _i15;
import 'package:jews_harp/features/auth/infrastructure/repositories/user_repository.dart'
    as _i17;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_authentication/email_auth_bloc.dart'
    as _i54;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart'
    as _i55;
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart'
    as _i51;
import 'package:jews_harp/features/auth/presentation/BLoCs/password_reset/password_reset_bloc.dart'
    as _i21;
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart'
    as _i56;
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart'
    as _i49;
import 'package:jews_harp/features/user_section/application/get_visible_categories.dart'
    as _i44;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/category_repository.dart'
    as _i10;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart'
    as _i6;
import 'package:jews_harp/features/user_section/infrastructure/repositories/category_repository.dart'
    as _i11;

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
  gh.lazySingleton<_i3.ErrorBloc>(() => _i3.ErrorBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i4.FirebaseAdminDataSource>(
      () => _i4.FirebaseAdminDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i5.FirebaseAuthDataSource>(
      () => _i5.FirebaseAuthDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i6.FirebaseUserSectionDataSource>(
      () => _i6.FirebaseUserSectionDataSource(),
      registerFor: {_prod});
  gh.factory<_i7.HideFieldInputBloc>(() => _i7.HideFieldInputBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i8.ICategoryAdminRepository>(
      () => _i9.CategoryAdminRepository(get<_i4.FirebaseAdminDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i10.ICategoryRepository>(
      () => _i11.CategoryRepository(get<_i6.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i12.ITechniqueAdminRepository>(
      () => _i13.TechniqueAdminRepository(get<_i4.FirebaseAdminDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i14.IUserFacade>(() => _i15.FirebaseAuthFacade(),
      registerFor: {_prod});
  gh.lazySingleton<_i16.IUserRepository>(
      () => _i17.UserRepository(get<_i5.FirebaseAuthDataSource>()),
      registerFor: {_prod, _user_repository_test_env});
  gh.lazySingleton<_i18.LinkEmailProvider>(
      () => _i18.LinkEmailProvider(get<_i14.IUserFacade>()),
      registerFor: {_prod, _dev, _link_email_provider_test_env});
  gh.lazySingleton<_i19.LinkFacebookProvider>(
      () => _i19.LinkFacebookProvider(get<_i14.IUserFacade>()),
      registerFor: {_prod, _dev, _link_facebook_provider_test_env});
  gh.lazySingleton<_i20.PasswordReset>(
      () => _i20.PasswordReset(get<_i14.IUserFacade>()),
      registerFor: {_prod, _dev, _password_reset_test_env});
  gh.factory<_i21.PasswordResetBloc>(
      () => _i21.PasswordResetBloc(
          get<_i20.PasswordReset>(), get<_i3.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i22.PickImage>(() => _i22.PickImage(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i23.PickVideo>(() => _i23.PickVideo(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i24.SendEmailVerification>(
      () => _i24.SendEmailVerification(get<_i14.IUserFacade>()),
      registerFor: {_prod, _dev, _send_email_verification_test_env});
  gh.lazySingleton<_i25.SetLocale>(
      () =>
          _i25.SetLocale(get<_i14.IUserFacade>(), get<_i16.IUserRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i26.SignOut>(() => _i26.SignOut(get<_i14.IUserFacade>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i27.SignUp>(() => _i27.SignUp(get<_i16.IUserRepository>()),
      registerFor: {_prod, _dev, _sign_up_test_env});
  gh.factory<_i28.ThumbnailPickerBloc>(
      () => _i28.ThumbnailPickerBloc(get<_i22.PickImage>()),
      registerFor: {_prod, _dev});
  gh.factory<_i29.ToggleSwitchBloc>(() => _i29.ToggleSwitchBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i30.UpdateCategory>(
      () => _i30.UpdateCategory(get<_i8.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i31.UpdateTechnique>(
      () => _i31.UpdateTechnique(get<_i12.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i32.VideoPickerBloc>(
      () => _i32.VideoPickerBloc(get<_i23.PickVideo>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i33.CreateCategory>(
      () => _i33.CreateCategory(get<_i8.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i34.CreateTechnique>(
      () => _i34.CreateTechnique(get<_i12.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i35.EmailAuthentication>(
      () => _i35.EmailAuthentication(get<_i16.IUserRepository>()),
      registerFor: {_prod, _dev, _email_authentication_test_env});
  gh.lazySingleton<_i36.EmailIsVerified>(
      () => _i36.EmailIsVerified(get<_i14.IUserFacade>()),
      registerFor: {_prod, _dev, _email_verification_check_test_env});
  gh.lazySingleton<_i37.FacebookAuthentication>(
      () => _i37.FacebookAuthentication(get<_i16.IUserRepository>()),
      registerFor: {_prod, _dev, _facebook_authentication_test_env});
  gh.lazySingleton<_i38.GetAllCategories>(
      () => _i38.GetAllCategories(get<_i8.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i39.GetAllTechniques>(
      () => _i39.GetAllTechniques(get<_i12.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i40.GetAuthProviders>(
      () => _i40.GetAuthProviders(get<_i16.IUserRepository>()),
      registerFor: {_prod, _dev, _get_authentication_providers_test_env});
  gh.lazySingleton<_i41.GetCurrentUser>(
      () => _i41.GetCurrentUser(get<_i16.IUserRepository>()),
      registerFor: {_prod, _dev, _get_current_user_test_env});
  gh.lazySingleton<_i42.GetHiddenCategories>(
      () => _i42.GetHiddenCategories(get<_i8.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i43.GetTechniquesByCategory>(
      () => _i43.GetTechniquesByCategory(get<_i12.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i44.GetVisibleCategories>(
      () => _i44.GetVisibleCategories(get<_i10.ICategoryRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i45.GoogleAuthentication>(
      () => _i45.GoogleAuthentication(get<_i16.IUserRepository>()),
      registerFor: {_prod, _dev, _google_authentication_test_env});
  gh.factory<_i46.HiddenCategoriesBloc>(
      () => _i46.HiddenCategoriesBloc(get<_i42.GetHiddenCategories>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i47.TechniqueFormBloc, _i47.TechniqueFormState?, dynamic>(
      (initialState, _) => _i47.TechniqueFormBloc(
          initialState,
          get<_i38.GetAllCategories>(),
          get<_i34.CreateTechnique>(),
          get<_i31.UpdateTechnique>(),
          get<_i3.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i48.TechniqueListBloc>(
      () => _i48.TechniqueListBloc(get<_i39.GetAllTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i49.ThirdPartyAuthBloc>(
      () => _i49.ThirdPartyAuthBloc(
          get<_i37.FacebookAuthentication>(),
          get<_i45.GoogleAuthentication>(),
          get<_i40.GetAuthProviders>(),
          get<_i19.LinkFacebookProvider>()),
      registerFor: {_prod, _dev});
  gh.factory<_i50.VisibleCategoriesBloc>(
      () => _i50.VisibleCategoriesBloc(get<_i44.GetVisibleCategories>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i51.AuthBloc>(
      () => _i51.AuthBloc(
          get<_i41.GetCurrentUser>(),
          get<_i36.EmailIsVerified>(),
          get<_i25.SetLocale>(),
          get<_i26.SignOut>()),
      registerFor: {_prod, _dev});
  gh.factory<_i52.CategoryDetailBloc>(
      () => _i52.CategoryDetailBloc(get<_i43.GetTechniquesByCategory>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i53.CategoryFormBloc, _i53.CategoryFormState?, dynamic>(
      (initialState, _) => _i53.CategoryFormBloc(
          initialState, get<_i33.CreateCategory>(), get<_i30.UpdateCategory>()),
      registerFor: {_prod, _dev});
  gh.factory<_i54.EmailAuthBloc>(
      () => _i54.EmailAuthBloc(
          get<_i35.EmailAuthentication>(), get<_i3.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i55.EmailVerificationBloc>(
      () => _i55.EmailVerificationBloc(
          get<_i26.SignOut>(),
          get<_i24.SendEmailVerification>(),
          get<_i36.EmailIsVerified>(),
          get<_i3.ErrorBloc>(),
          get<_i51.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i56.SignUpBloc>(
      () => _i56.SignUpBloc(
          get<_i27.SignUp>(),
          get<_i40.GetAuthProviders>(),
          get<_i18.LinkEmailProvider>(),
          get<_i3.ErrorBloc>(),
          get<_i51.AuthBloc>()),
      registerFor: {_prod, _dev});
  return get;
}
