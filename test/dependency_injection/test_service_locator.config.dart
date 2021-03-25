// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jews_harp/core/BLoCs/errors/error_bloc.dart' as _i3;
import 'package:jews_harp/core/BLoCs/hide_field_input/hide_field_input_bloc.dart'
    as _i9;
import 'package:jews_harp/core/BLoCs/toggle_switch/toggle_switch_bloc.dart'
    as _i34;
import 'package:jews_harp/features/admin/application/use_cases/create_category.dart'
    as _i39;
import 'package:jews_harp/features/admin/application/use_cases/create_technique.dart'
    as _i40;
import 'package:jews_harp/features/admin/application/use_cases/get_all_categories.dart'
    as _i44;
import 'package:jews_harp/features/admin/application/use_cases/get_all_techniques.dart'
    as _i45;
import 'package:jews_harp/features/admin/application/use_cases/get_category_localized_data.dart'
    as _i48;
import 'package:jews_harp/features/admin/application/use_cases/get_hidden_categories.dart'
    as _i50;
import 'package:jews_harp/features/admin/application/use_cases/get_technique_localized_data.dart'
    as _i52;
import 'package:jews_harp/features/admin/application/use_cases/get_visible_categories.dart'
    as _i55;
import 'package:jews_harp/features/admin/application/use_cases/pick_image.dart'
    as _i26;
import 'package:jews_harp/features/admin/application/use_cases/pick_video.dart'
    as _i27;
import 'package:jews_harp/features/admin/application/use_cases/update_category.dart'
    as _i35;
import 'package:jews_harp/features/admin/application/use_cases/update_technique.dart'
    as _i36;
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart'
    as _i10;
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart'
    as _i14;
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart'
    as _i5;
import 'package:jews_harp/features/admin/infrastructure/repositories/category_admin_repository.dart'
    as _i11;
import 'package:jews_harp/features/admin/infrastructure/repositories/technique_admin_repository.dart'
    as _i15;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_detail/category_detail_bloc.dart'
    as _i66;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart'
    as _i67;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_localization/category_localization_bloc.dart'
    as _i68;
import 'package:jews_harp/features/admin/presentation/BLoCs/hidden_categories/hidden_categories_bloc.dart'
    as _i57;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_form/technique_form_bloc.dart'
    as _i58;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_list/technique_list_bloc.dart'
    as _i59;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_localization/technique_localization_bloc.dart'
    as _i60;
import 'package:jews_harp/features/admin/presentation/BLoCs/thumbnail_picker/thumbnail_picker_bloc.dart'
    as _i33;
import 'package:jews_harp/features/admin/presentation/BLoCs/video_picker/video_picker_bloc.dart'
    as _i38;
import 'package:jews_harp/features/admin/presentation/BLoCs/visible_categories/visible_categories_bloc.dart'
    as _i63;
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart'
    as _i41;
import 'package:jews_harp/features/auth/application/use_cases/email_verification_check.dart'
    as _i42;
import 'package:jews_harp/features/auth/application/use_cases/facebook_authentication.dart'
    as _i43;
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart'
    as _i46;
import 'package:jews_harp/features/auth/application/use_cases/get_current_user.dart'
    as _i49;
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart'
    as _i56;
import 'package:jews_harp/features/auth/application/use_cases/link_email_provider.dart'
    as _i22;
import 'package:jews_harp/features/auth/application/use_cases/link_facebook_provider.dart'
    as _i23;
import 'package:jews_harp/features/auth/application/use_cases/password_reset.dart'
    as _i24;
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart'
    as _i28;
import 'package:jews_harp/features/auth/application/use_cases/set_locale.dart'
    as _i29;
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart'
    as _i30;
import 'package:jews_harp/features/auth/application/use_cases/sign_up.dart'
    as _i31;
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart'
    as _i18;
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart'
    as _i20;
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart'
    as _i6;
import 'package:jews_harp/features/auth/infrastructure/facades/user_facade.dart'
    as _i19;
import 'package:jews_harp/features/auth/infrastructure/repositories/user_repository.dart'
    as _i21;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_authentication/email_auth_bloc.dart'
    as _i69;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart'
    as _i70;
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart'
    as _i64;
import 'package:jews_harp/features/auth/presentation/BLoCs/password_reset/password_reset_bloc.dart'
    as _i25;
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart'
    as _i71;
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart'
    as _i62;
import 'package:jews_harp/features/user_section/application/get_categories.dart'
    as _i47;
import 'package:jews_harp/features/user_section/application/get_most_recent_techniques.dart'
    as _i51;
import 'package:jews_harp/features/user_section/application/get_techniques.dart'
    as _i53;
import 'package:jews_harp/features/user_section/application/get_techniques_by_category.dart'
    as _i54;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/category_repository.dart'
    as _i12;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart'
    as _i16;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart'
    as _i8;
import 'package:jews_harp/features/user_section/infrastructure/repositories/category_repository.dart'
    as _i13;
import 'package:jews_harp/features/user_section/infrastructure/repositories/technique_repository.dart'
    as _i17;
import 'package:jews_harp/features/user_section/presentation/BLoCs/categories/categories_bloc.dart'
    as _i65;
import 'package:jews_harp/features/user_section/presentation/BLoCs/filter_screen/filter_screen_bloc.dart'
    as _i4;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_detail/technique_detail_bloc.dart'
    as _i32;
import 'package:jews_harp/features/user_section/presentation/BLoCs/techniques/techniques_bloc.dart'
    as _i61;
import 'package:jews_harp/features/user_section/presentation/BLoCs/user_section_navigation/user_section_navigation_bloc.dart'
    as _i37;

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
  gh.lazySingleton<_i3.ErrorBloc>(() => _i3.ErrorBloc(),
      registerFor: {_prod, _dev});
  gh.factory<_i4.FilterScreenBloc>(() => _i4.FilterScreenBloc(),
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
  gh.lazySingleton<_i10.ICategoryAdminRepository>(
      () => _i11.CategoryAdminRepository(get<_i5.FirebaseAdminDataSource>(),
          get<_i8.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i12.ICategoryRepository>(
      () => _i13.CategoryRepository(get<_i8.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i14.ITechniqueAdminRepository>(
      () => _i15.TechniqueAdminRepository(get<_i5.FirebaseAdminDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i16.ITechniqueRepository>(
      () => _i17.TechniqueRepository(get<_i8.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i18.IUserFacade>(() => _i7.IUserFacadeMock(), registerFor: {
    _email_authentication_test_env,
    _get_current_user_test_env,
    _sign_up_test_env,
    _email_verification_check_test_env,
    _link_email_provider_test_env,
    _link_facebook_provider_test_env,
    _password_reset_test_env,
    _send_email_verification_test_env
  });
  gh.lazySingleton<_i18.IUserFacade>(() => _i19.FirebaseAuthFacade(),
      registerFor: {_prod});
  gh.lazySingleton<_i20.IUserRepository>(() => _i7.IUserRepositoryMock(),
      registerFor: {
        _email_authentication_test_env,
        _get_current_user_test_env,
        _sign_up_test_env,
        _facebook_authentication_test_env,
        _google_authentication_test_env,
        _get_authentication_providers_test_env
      });
  gh.lazySingleton<_i20.IUserRepository>(
      () => _i21.UserRepository(get<_i6.FirebaseAuthDataSource>()),
      registerFor: {_prod, _user_repository_test_env});
  gh.lazySingleton<_i22.LinkEmailProvider>(
      () => _i22.LinkEmailProvider(get<_i18.IUserFacade>()),
      registerFor: {_prod, _dev, _link_email_provider_test_env});
  gh.lazySingleton<_i23.LinkFacebookProvider>(
      () => _i23.LinkFacebookProvider(get<_i18.IUserFacade>()),
      registerFor: {_prod, _dev, _link_facebook_provider_test_env});
  gh.lazySingleton<_i24.PasswordReset>(
      () => _i24.PasswordReset(get<_i18.IUserFacade>()),
      registerFor: {_prod, _dev, _password_reset_test_env});
  gh.factory<_i25.PasswordResetBloc>(
      () => _i25.PasswordResetBloc(
          get<_i24.PasswordReset>(), get<_i3.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i26.PickImage>(() => _i26.PickImage(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i27.PickVideo>(() => _i27.PickVideo(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i28.SendEmailVerification>(
      () => _i28.SendEmailVerification(get<_i18.IUserFacade>()),
      registerFor: {_prod, _dev, _send_email_verification_test_env});
  gh.lazySingleton<_i29.SetLocale>(
      () =>
          _i29.SetLocale(get<_i18.IUserFacade>(), get<_i20.IUserRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i30.SignOut>(() => _i30.SignOut(get<_i18.IUserFacade>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i31.SignUp>(() => _i31.SignUp(get<_i20.IUserRepository>()),
      registerFor: {_prod, _dev, _sign_up_test_env});
  gh.factory<_i32.TechniqueDetailBloc>(() => _i32.TechniqueDetailBloc(),
      registerFor: {_prod, _dev});
  gh.factory<_i33.ThumbnailPickerBloc>(
      () => _i33.ThumbnailPickerBloc(get<_i26.PickImage>()),
      registerFor: {_prod, _dev});
  gh.factory<_i34.ToggleSwitchBloc>(() => _i34.ToggleSwitchBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i35.UpdateCategory>(
      () => _i35.UpdateCategory(get<_i10.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i36.UpdateTechnique>(
      () => _i36.UpdateTechnique(get<_i14.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i37.UserSectionNavigationBloc>(
      () => _i37.UserSectionNavigationBloc(),
      registerFor: {_prod, _dev});
  gh.factory<_i38.VideoPickerBloc>(
      () => _i38.VideoPickerBloc(get<_i27.PickVideo>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i39.CreateCategory>(
      () => _i39.CreateCategory(get<_i10.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i40.CreateTechnique>(
      () => _i40.CreateTechnique(get<_i14.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i41.EmailAuthentication>(
      () => _i41.EmailAuthentication(get<_i20.IUserRepository>()),
      registerFor: {_prod, _dev, _email_authentication_test_env});
  gh.lazySingleton<_i42.EmailIsVerified>(
      () => _i42.EmailIsVerified(get<_i18.IUserFacade>()),
      registerFor: {_prod, _dev, _email_verification_check_test_env});
  gh.lazySingleton<_i43.FacebookAuthentication>(
      () => _i43.FacebookAuthentication(get<_i20.IUserRepository>()),
      registerFor: {_prod, _dev, _facebook_authentication_test_env});
  gh.lazySingleton<_i44.GetAllCategories>(
      () => _i44.GetAllCategories(get<_i10.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i45.GetAllTechniques>(
      () => _i45.GetAllTechniques(get<_i14.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i46.GetAuthProviders>(
      () => _i46.GetAuthProviders(get<_i20.IUserRepository>()),
      registerFor: {_prod, _dev, _get_authentication_providers_test_env});
  gh.lazySingleton<_i47.GetCategories>(
      () => _i47.GetCategories(get<_i12.ICategoryRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i48.GetCategoryLocalizedData>(
      () => _i48.GetCategoryLocalizedData(get<_i10.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i49.GetCurrentUser>(
      () => _i49.GetCurrentUser(get<_i20.IUserRepository>()),
      registerFor: {_prod, _dev, _get_current_user_test_env});
  gh.lazySingleton<_i50.GetHiddenCategories>(
      () => _i50.GetHiddenCategories(get<_i10.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i51.GetMostRecentTechniques>(
      () => _i51.GetMostRecentTechniques(get<_i16.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i52.GetTechniqueLocalizedData>(
      () =>
          _i52.GetTechniqueLocalizedData(get<_i14.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i53.GetTechniques>(
      () => _i53.GetTechniques(get<_i16.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i54.GetTechniquesByCategory>(
      () => _i54.GetTechniquesByCategory(get<_i16.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i55.GetVisibleCategories>(
      () => _i55.GetVisibleCategories(get<_i10.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i56.GoogleAuthentication>(
      () => _i56.GoogleAuthentication(get<_i20.IUserRepository>()),
      registerFor: {_prod, _dev, _google_authentication_test_env});
  gh.factory<_i57.HiddenCategoriesBloc>(
      () => _i57.HiddenCategoriesBloc(get<_i50.GetHiddenCategories>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i58.TechniqueFormBloc, _i58.TechniqueFormState?, dynamic>(
      (initialState, _) => _i58.TechniqueFormBloc(
          initialState,
          get<_i44.GetAllCategories>(),
          get<_i40.CreateTechnique>(),
          get<_i36.UpdateTechnique>(),
          get<_i3.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i59.TechniqueListBloc>(
      () => _i59.TechniqueListBloc(get<_i45.GetAllTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i60.TechniqueLocalizationBloc>(
      () =>
          _i60.TechniqueLocalizationBloc(get<_i52.GetTechniqueLocalizedData>()),
      registerFor: {_prod, _dev});
  gh.factory<_i61.TechniquesBloc>(
      () => _i61.TechniquesBloc(get<_i51.GetMostRecentTechniques>(),
          get<_i54.GetTechniquesByCategory>(), get<_i53.GetTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i62.ThirdPartyAuthBloc>(
      () => _i62.ThirdPartyAuthBloc(
          get<_i43.FacebookAuthentication>(),
          get<_i56.GoogleAuthentication>(),
          get<_i46.GetAuthProviders>(),
          get<_i23.LinkFacebookProvider>()),
      registerFor: {_prod, _dev});
  gh.factory<_i63.VisibleCategoriesBloc>(
      () => _i63.VisibleCategoriesBloc(get<_i55.GetVisibleCategories>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i64.AuthBloc>(
      () => _i64.AuthBloc(
          get<_i49.GetCurrentUser>(),
          get<_i42.EmailIsVerified>(),
          get<_i29.SetLocale>(),
          get<_i30.SignOut>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i65.CategoriesBloc>(
      () => _i65.CategoriesBloc(get<_i47.GetCategories>()),
      registerFor: {_prod, _dev});
  gh.factory<_i66.CategoryDetailBloc>(
      () => _i66.CategoryDetailBloc(get<_i54.GetTechniquesByCategory>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i67.CategoryFormBloc, _i67.CategoryFormState?, dynamic>(
      (initialState, _) => _i67.CategoryFormBloc(
          initialState, get<_i39.CreateCategory>(), get<_i35.UpdateCategory>()),
      registerFor: {_prod, _dev});
  gh.factory<_i68.CategoryLocalizationBloc>(
      () => _i68.CategoryLocalizationBloc(get<_i48.GetCategoryLocalizedData>()),
      registerFor: {_prod, _dev});
  gh.factory<_i69.EmailAuthBloc>(
      () => _i69.EmailAuthBloc(
          get<_i41.EmailAuthentication>(), get<_i3.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i70.EmailVerificationBloc>(
      () => _i70.EmailVerificationBloc(
          get<_i30.SignOut>(),
          get<_i28.SendEmailVerification>(),
          get<_i42.EmailIsVerified>(),
          get<_i3.ErrorBloc>(),
          get<_i64.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i71.SignUpBloc>(
      () => _i71.SignUpBloc(
          get<_i31.SignUp>(),
          get<_i46.GetAuthProviders>(),
          get<_i22.LinkEmailProvider>(),
          get<_i3.ErrorBloc>(),
          get<_i64.AuthBloc>()),
      registerFor: {_prod, _dev});
  return get;
}
