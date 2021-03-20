// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jews_harp/core/BLoCs/errors/error_bloc.dart' as _i4;
import 'package:jews_harp/core/BLoCs/hide_field_input/hide_field_input_bloc.dart'
    as _i9;
import 'package:jews_harp/core/BLoCs/toggle_switch/toggle_switch_bloc.dart'
    as _i34;
import 'package:jews_harp/features/admin/application/use_cases/create_category.dart'
    as _i38;
import 'package:jews_harp/features/admin/application/use_cases/create_technique.dart'
    as _i39;
import 'package:jews_harp/features/admin/application/use_cases/get_all_categories.dart'
    as _i43;
import 'package:jews_harp/features/admin/application/use_cases/get_all_techniques.dart'
    as _i44;
import 'package:jews_harp/features/admin/application/use_cases/get_hidden_categories.dart'
    as _i48;
import 'package:jews_harp/features/admin/application/use_cases/get_techniques_by_category.dart'
    as _i50;
import 'package:jews_harp/features/admin/application/use_cases/get_visible_categories.dart'
    as _i51;
import 'package:jews_harp/features/admin/application/use_cases/pick_image.dart'
    as _i27;
import 'package:jews_harp/features/admin/application/use_cases/pick_video.dart'
    as _i28;
import 'package:jews_harp/features/admin/application/use_cases/update_category.dart'
    as _i35;
import 'package:jews_harp/features/admin/application/use_cases/update_technique.dart'
    as _i36;
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart'
    as _i11;
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart'
    as _i15;
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart'
    as _i5;
import 'package:jews_harp/features/admin/infrastructure/repositories/category_admin_repository.dart'
    as _i12;
import 'package:jews_harp/features/admin/infrastructure/repositories/technique_admin_repository.dart'
    as _i16;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_detail/category_detail_bloc.dart'
    as _i61;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart'
    as _i62;
import 'package:jews_harp/features/admin/presentation/BLoCs/hidden_categories/hidden_categories_bloc.dart'
    as _i53;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_form/technique_form_bloc.dart'
    as _i55;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_list/technique_list_bloc.dart'
    as _i56;
import 'package:jews_harp/features/admin/presentation/BLoCs/thumbnail_picker/thumbnail_picker_bloc.dart'
    as _i33;
import 'package:jews_harp/features/admin/presentation/BLoCs/video_picker/video_picker_bloc.dart'
    as _i37;
import 'package:jews_harp/features/admin/presentation/BLoCs/visible_categories/visible_categories_bloc.dart'
    as _i58;
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart'
    as _i40;
import 'package:jews_harp/features/auth/application/use_cases/email_verification_check.dart'
    as _i41;
import 'package:jews_harp/features/auth/application/use_cases/facebook_authentication.dart'
    as _i42;
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart'
    as _i45;
import 'package:jews_harp/features/auth/application/use_cases/get_current_user.dart'
    as _i47;
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart'
    as _i52;
import 'package:jews_harp/features/auth/application/use_cases/link_email_provider.dart'
    as _i23;
import 'package:jews_harp/features/auth/application/use_cases/link_facebook_provider.dart'
    as _i24;
import 'package:jews_harp/features/auth/application/use_cases/password_reset.dart'
    as _i25;
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart'
    as _i29;
import 'package:jews_harp/features/auth/application/use_cases/set_locale.dart'
    as _i30;
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart'
    as _i31;
import 'package:jews_harp/features/auth/application/use_cases/sign_up.dart'
    as _i32;
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart'
    as _i19;
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart'
    as _i21;
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart'
    as _i6;
import 'package:jews_harp/features/auth/infrastructure/facades/user_facade.dart'
    as _i20;
import 'package:jews_harp/features/auth/infrastructure/repositories/user_repository.dart'
    as _i22;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_authentication/email_auth_bloc.dart'
    as _i63;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart'
    as _i64;
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart'
    as _i59;
import 'package:jews_harp/features/auth/presentation/BLoCs/password_reset/password_reset_bloc.dart'
    as _i26;
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart'
    as _i65;
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart'
    as _i57;
import 'package:jews_harp/features/user_section/application/get_categories.dart'
    as _i46;
import 'package:jews_harp/features/user_section/application/get_most_recent_techniques.dart'
    as _i49;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/category_repository.dart'
    as _i13;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart'
    as _i17;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart'
    as _i8;
import 'package:jews_harp/features/user_section/infrastructure/repositories/category_repository.dart'
    as _i14;
import 'package:jews_harp/features/user_section/infrastructure/repositories/technique_repository.dart'
    as _i18;
import 'package:jews_harp/features/user_section/presentation/BLoCs/bottom_navigator/bottom_navigator_bloc.dart'
    as _i3;
import 'package:jews_harp/features/user_section/presentation/BLoCs/categories/categories_bloc.dart'
    as _i60;
import 'package:jews_harp/features/user_section/presentation/BLoCs/home_screen/home_screen_bloc.dart'
    as _i10;
import 'package:jews_harp/features/user_section/presentation/BLoCs/new_techniques/new_techniques_bloc.dart'
    as _i54;

import 'mock.dart' as _i7;

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
  gh.factory<_i3.BottomNavigatorBloc>(() => _i3.BottomNavigatorBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i4.ErrorBloc>(() => _i4.ErrorBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i5.FirebaseAdminDataSource>(
      () => _i5.FirebaseAdminDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i6.FirebaseAuthDataSource>(
      () => _i6.FirebaseAuthDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i6.FirebaseAuthDataSource>(
      () => _i7.FirebaseAuthDataSourceMock(),
      registerFor: {_user_repository_test_env});
  gh.lazySingleton<_i8.FirebaseUserSectionDataSource>(
      () => _i8.FirebaseUserSectionDataSource(),
      registerFor: {_prod});
  gh.factory<_i9.HideFieldInputBloc>(() => _i9.HideFieldInputBloc(),
      registerFor: {_prod, _dev});
  gh.factory<_i10.HomeScreenBloc>(() => _i10.HomeScreenBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i11.ICategoryAdminRepository>(
      () => _i12.CategoryAdminRepository(get<_i5.FirebaseAdminDataSource>(),
          get<_i8.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i13.ICategoryRepository>(
      () => _i14.CategoryRepository(get<_i8.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i15.ITechniqueAdminRepository>(
      () => _i16.TechniqueAdminRepository(get<_i5.FirebaseAdminDataSource>(),
          get<_i8.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i17.ITechniqueRepository>(
      () => _i18.TechniqueRepository(get<_i8.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i19.IUserFacade>(() => _i20.FirebaseAuthFacade(),
      registerFor: {_prod});
  gh.lazySingleton<_i19.IUserFacade>(() => _i7.IUserFacadeMock(), registerFor: {
    _email_authentication_test_env,
    _get_current_user_test_env,
    _sign_up_test_env,
    _email_verification_check_test_env,
    _link_email_provider_test_env,
    _link_facebook_provider_test_env,
    _password_reset_test_env,
    _send_email_verification_test_env
  });
  gh.lazySingleton<_i21.IUserRepository>(() => _i7.IUserRepositoryMock(),
      registerFor: {
        _email_authentication_test_env,
        _get_current_user_test_env,
        _sign_up_test_env,
        _facebook_authentication_test_env,
        _google_authentication_test_env,
        _get_authentication_providers_test_env
      });
  gh.lazySingleton<_i21.IUserRepository>(
      () => _i22.UserRepository(get<_i6.FirebaseAuthDataSource>()),
      registerFor: {_prod, _user_repository_test_env});
  gh.lazySingleton<_i23.LinkEmailProvider>(
      () => _i23.LinkEmailProvider(get<_i19.IUserFacade>()),
      registerFor: {_prod, _dev, _link_email_provider_test_env});
  gh.lazySingleton<_i24.LinkFacebookProvider>(
      () => _i24.LinkFacebookProvider(get<_i19.IUserFacade>()),
      registerFor: {_prod, _dev, _link_facebook_provider_test_env});
  gh.lazySingleton<_i25.PasswordReset>(
      () => _i25.PasswordReset(get<_i19.IUserFacade>()),
      registerFor: {_prod, _dev, _password_reset_test_env});
  gh.factory<_i26.PasswordResetBloc>(
      () => _i26.PasswordResetBloc(
          get<_i25.PasswordReset>(), get<_i4.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i27.PickImage>(() => _i27.PickImage(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i28.PickVideo>(() => _i28.PickVideo(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i29.SendEmailVerification>(
      () => _i29.SendEmailVerification(get<_i19.IUserFacade>()),
      registerFor: {_prod, _dev, _send_email_verification_test_env});
  gh.lazySingleton<_i30.SetLocale>(
      () =>
          _i30.SetLocale(get<_i19.IUserFacade>(), get<_i21.IUserRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i31.SignOut>(() => _i31.SignOut(get<_i19.IUserFacade>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i32.SignUp>(() => _i32.SignUp(get<_i21.IUserRepository>()),
      registerFor: {_prod, _dev, _sign_up_test_env});
  gh.factory<_i33.ThumbnailPickerBloc>(
      () => _i33.ThumbnailPickerBloc(get<_i27.PickImage>()),
      registerFor: {_prod, _dev});
  gh.factory<_i34.ToggleSwitchBloc>(() => _i34.ToggleSwitchBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i35.UpdateCategory>(
      () => _i35.UpdateCategory(get<_i11.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i36.UpdateTechnique>(
      () => _i36.UpdateTechnique(get<_i15.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i37.VideoPickerBloc>(
      () => _i37.VideoPickerBloc(get<_i28.PickVideo>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i38.CreateCategory>(
      () => _i38.CreateCategory(get<_i11.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i39.CreateTechnique>(
      () => _i39.CreateTechnique(get<_i15.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i40.EmailAuthentication>(
      () => _i40.EmailAuthentication(get<_i21.IUserRepository>()),
      registerFor: {_prod, _dev, _email_authentication_test_env});
  gh.lazySingleton<_i41.EmailIsVerified>(
      () => _i41.EmailIsVerified(get<_i19.IUserFacade>()),
      registerFor: {_prod, _dev, _email_verification_check_test_env});
  gh.lazySingleton<_i42.FacebookAuthentication>(
      () => _i42.FacebookAuthentication(get<_i21.IUserRepository>()),
      registerFor: {_prod, _dev, _facebook_authentication_test_env});
  gh.lazySingleton<_i43.GetAllCategories>(
      () => _i43.GetAllCategories(get<_i11.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i44.GetAllTechniques>(
      () => _i44.GetAllTechniques(get<_i15.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i45.GetAuthProviders>(
      () => _i45.GetAuthProviders(get<_i21.IUserRepository>()),
      registerFor: {_prod, _dev, _get_authentication_providers_test_env});
  gh.lazySingleton<_i46.GetCategories>(
      () => _i46.GetCategories(get<_i13.ICategoryRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i47.GetCurrentUser>(
      () => _i47.GetCurrentUser(get<_i21.IUserRepository>()),
      registerFor: {_prod, _dev, _get_current_user_test_env});
  gh.lazySingleton<_i48.GetHiddenCategories>(
      () => _i48.GetHiddenCategories(get<_i11.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i49.GetMostRecentTechniques>(
      () => _i49.GetMostRecentTechniques(get<_i17.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i50.GetTechniquesByCategory>(
      () => _i50.GetTechniquesByCategory(get<_i15.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i51.GetVisibleCategories>(
      () => _i51.GetVisibleCategories(get<_i11.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i52.GoogleAuthentication>(
      () => _i52.GoogleAuthentication(get<_i21.IUserRepository>()),
      registerFor: {_prod, _dev, _google_authentication_test_env});
  gh.factory<_i53.HiddenCategoriesBloc>(
      () => _i53.HiddenCategoriesBloc(get<_i48.GetHiddenCategories>()),
      registerFor: {_prod, _dev});
  gh.factory<_i54.NewTechniquesBloc>(
      () => _i54.NewTechniquesBloc(get<_i49.GetMostRecentTechniques>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i55.TechniqueFormBloc, _i55.TechniqueFormState?, dynamic>(
      (initialState, _) => _i55.TechniqueFormBloc(
          initialState,
          get<_i43.GetAllCategories>(),
          get<_i39.CreateTechnique>(),
          get<_i36.UpdateTechnique>(),
          get<_i4.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i56.TechniqueListBloc>(
      () => _i56.TechniqueListBloc(get<_i44.GetAllTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i57.ThirdPartyAuthBloc>(
      () => _i57.ThirdPartyAuthBloc(
          get<_i42.FacebookAuthentication>(),
          get<_i52.GoogleAuthentication>(),
          get<_i45.GetAuthProviders>(),
          get<_i24.LinkFacebookProvider>()),
      registerFor: {_prod, _dev});
  gh.factory<_i58.VisibleCategoriesBloc>(
      () => _i58.VisibleCategoriesBloc(get<_i51.GetVisibleCategories>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i59.AuthBloc>(
      () => _i59.AuthBloc(
          get<_i47.GetCurrentUser>(),
          get<_i41.EmailIsVerified>(),
          get<_i30.SetLocale>(),
          get<_i31.SignOut>()),
      registerFor: {_prod, _dev});
  gh.factory<_i60.CategoriesBloc>(
      () => _i60.CategoriesBloc(get<_i46.GetCategories>()),
      registerFor: {_prod, _dev});
  gh.factory<_i61.CategoryDetailBloc>(
      () => _i61.CategoryDetailBloc(get<_i50.GetTechniquesByCategory>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i62.CategoryFormBloc, _i62.CategoryFormState?, dynamic>(
      (initialState, _) => _i62.CategoryFormBloc(
          initialState, get<_i38.CreateCategory>(), get<_i35.UpdateCategory>()),
      registerFor: {_prod, _dev});
  gh.factory<_i63.EmailAuthBloc>(
      () => _i63.EmailAuthBloc(
          get<_i40.EmailAuthentication>(), get<_i4.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i64.EmailVerificationBloc>(
      () => _i64.EmailVerificationBloc(
          get<_i31.SignOut>(),
          get<_i29.SendEmailVerification>(),
          get<_i41.EmailIsVerified>(),
          get<_i4.ErrorBloc>(),
          get<_i59.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i65.SignUpBloc>(
      () => _i65.SignUpBloc(
          get<_i32.SignUp>(),
          get<_i45.GetAuthProviders>(),
          get<_i23.LinkEmailProvider>(),
          get<_i4.ErrorBloc>(),
          get<_i59.AuthBloc>()),
      registerFor: {_prod, _dev});
  return get;
}
