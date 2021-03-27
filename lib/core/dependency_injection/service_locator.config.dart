// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jews_harp/core/BLoCs/errors/error_bloc.dart' as _i4;
import 'package:jews_harp/core/BLoCs/hide_field_input/hide_field_input_bloc.dart'
    as _i8;
import 'package:jews_harp/core/BLoCs/toggle_switch/toggle_switch_bloc.dart'
    as _i32;
import 'package:jews_harp/features/admin/application/use_cases/create_category.dart'
    as _i37;
import 'package:jews_harp/features/admin/application/use_cases/create_technique.dart'
    as _i38;
import 'package:jews_harp/features/admin/application/use_cases/get_all_categories.dart'
    as _i42;
import 'package:jews_harp/features/admin/application/use_cases/get_all_techniques.dart'
    as _i43;
import 'package:jews_harp/features/admin/application/use_cases/get_category_localized_data.dart'
    as _i46;
import 'package:jews_harp/features/admin/application/use_cases/get_hidden_categories.dart'
    as _i48;
import 'package:jews_harp/features/admin/application/use_cases/get_technique_localized_data.dart'
    as _i49;
import 'package:jews_harp/features/admin/application/use_cases/get_visible_categories.dart'
    as _i50;
import 'package:jews_harp/features/admin/application/use_cases/pick_image.dart'
    as _i23;
import 'package:jews_harp/features/admin/application/use_cases/pick_video.dart'
    as _i24;
import 'package:jews_harp/features/admin/application/use_cases/update_category.dart'
    as _i33;
import 'package:jews_harp/features/admin/application/use_cases/update_technique.dart'
    as _i34;
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart'
    as _i9;
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart'
    as _i13;
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart'
    as _i5;
import 'package:jews_harp/features/admin/infrastructure/repositories/category_admin_repository.dart'
    as _i10;
import 'package:jews_harp/features/admin/infrastructure/repositories/technique_admin_repository.dart'
    as _i14;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_detail/category_detail_bloc.dart'
    as _i76;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart'
    as _i62;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_localization/category_localization_bloc.dart'
    as _i63;
import 'package:jews_harp/features/admin/presentation/BLoCs/hidden_categories/hidden_categories_bloc.dart'
    as _i52;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_form/technique_form_bloc.dart'
    as _i55;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_list/technique_list_bloc.dart'
    as _i56;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_localization/technique_localization_bloc.dart'
    as _i57;
import 'package:jews_harp/features/admin/presentation/BLoCs/thumbnail_picker/thumbnail_picker_bloc.dart'
    as _i31;
import 'package:jews_harp/features/admin/presentation/BLoCs/video_picker/video_picker_bloc.dart'
    as _i36;
import 'package:jews_harp/features/admin/presentation/BLoCs/visible_categories/visible_categories_bloc.dart'
    as _i59;
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart'
    as _i39;
import 'package:jews_harp/features/auth/application/use_cases/email_verification_check.dart'
    as _i40;
import 'package:jews_harp/features/auth/application/use_cases/facebook_authentication.dart'
    as _i41;
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart'
    as _i44;
import 'package:jews_harp/features/auth/application/use_cases/get_current_user.dart'
    as _i47;
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart'
    as _i51;
import 'package:jews_harp/features/auth/application/use_cases/link_email_provider.dart'
    as _i19;
import 'package:jews_harp/features/auth/application/use_cases/link_facebook_provider.dart'
    as _i20;
import 'package:jews_harp/features/auth/application/use_cases/password_reset.dart'
    as _i21;
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart'
    as _i25;
import 'package:jews_harp/features/auth/application/use_cases/set_locale.dart'
    as _i26;
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart'
    as _i27;
import 'package:jews_harp/features/auth/application/use_cases/sign_up.dart'
    as _i28;
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart'
    as _i15;
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart'
    as _i17;
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart'
    as _i6;
import 'package:jews_harp/features/auth/infrastructure/facades/user_facade.dart'
    as _i16;
import 'package:jews_harp/features/auth/infrastructure/repositories/user_repository.dart'
    as _i18;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_authentication/email_auth_bloc.dart'
    as _i66;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart'
    as _i67;
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart'
    as _i60;
import 'package:jews_harp/features/auth/presentation/BLoCs/password_reset/password_reset_bloc.dart'
    as _i22;
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart'
    as _i74;
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart'
    as _i58;
import 'package:jews_harp/features/user_section/application/delete_downloaded_technique.dart'
    as _i64;
import 'package:jews_harp/features/user_section/application/download_technique.dart'
    as _i65;
import 'package:jews_harp/features/user_section/application/get_categories.dart'
    as _i45;
import 'package:jews_harp/features/user_section/application/get_downloaded_techniques.dart'
    as _i68;
import 'package:jews_harp/features/user_section/application/get_most_recent_techniques.dart'
    as _i69;
import 'package:jews_harp/features/user_section/application/get_technique_by_Id.dart'
    as _i70;
import 'package:jews_harp/features/user_section/application/get_techniques.dart'
    as _i71;
import 'package:jews_harp/features/user_section/application/get_techniques_by_category.dart'
    as _i72;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/category_repository.dart'
    as _i11;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart'
    as _i53;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/category_local_data_source.dart'
    as _i3;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart'
    as _i7;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/technique_local_data_source.dart'
    as _i30;
import 'package:jews_harp/features/user_section/infrastructure/repositories/category_repository.dart'
    as _i12;
import 'package:jews_harp/features/user_section/infrastructure/repositories/technique_repository.dart'
    as _i54;
import 'package:jews_harp/features/user_section/presentation/BLoCs/categories/categories_bloc.dart'
    as _i61;
import 'package:jews_harp/features/user_section/presentation/BLoCs/most_recent_techniques/most_recent_techniques_bloc.dart'
    as _i73;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique/technique_bloc.dart'
    as _i75;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_detail/technique_detail_bloc.dart'
    as _i29;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_local_storage/technique_local_storage_bloc.dart'
    as _i77;
import 'package:jews_harp/features/user_section/presentation/BLoCs/user_section_navigation/user_section_navigation_bloc.dart'
    as _i35;

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
  gh.lazySingleton<_i3.CategoryLocalDataSource>(
      () => _i3.CategoryLocalDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i4.ErrorBloc>(() => _i4.ErrorBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i5.FirebaseAdminDataSource>(
      () => _i5.FirebaseAdminDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i6.FirebaseAuthDataSource>(
      () => _i6.FirebaseAuthDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i7.FirebaseUserSectionDataSource>(
      () => _i7.FirebaseUserSectionDataSource(),
      registerFor: {_prod});
  gh.factory<_i8.HideFieldInputBloc>(() => _i8.HideFieldInputBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i9.ICategoryAdminRepository>(
      () => _i10.CategoryAdminRepository(get<_i5.FirebaseAdminDataSource>(),
          get<_i7.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i11.ICategoryRepository>(
      () => _i12.CategoryRepository(get<_i7.FirebaseUserSectionDataSource>(),
          get<_i3.CategoryLocalDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i13.ITechniqueAdminRepository>(
      () => _i14.TechniqueAdminRepository(get<_i5.FirebaseAdminDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i15.IUserFacade>(() => _i16.FirebaseAuthFacade(),
      registerFor: {_prod});
  gh.lazySingleton<_i17.IUserRepository>(
      () => _i18.UserRepository(get<_i6.FirebaseAuthDataSource>()),
      registerFor: {_prod, _user_repository_test_env});
  gh.lazySingleton<_i19.LinkEmailProvider>(
      () => _i19.LinkEmailProvider(get<_i15.IUserFacade>()),
      registerFor: {_prod, _dev, _link_email_provider_test_env});
  gh.lazySingleton<_i20.LinkFacebookProvider>(
      () => _i20.LinkFacebookProvider(get<_i15.IUserFacade>()),
      registerFor: {_prod, _dev, _link_facebook_provider_test_env});
  gh.lazySingleton<_i21.PasswordReset>(
      () => _i21.PasswordReset(get<_i15.IUserFacade>()),
      registerFor: {_prod, _dev, _password_reset_test_env});
  gh.factory<_i22.PasswordResetBloc>(
      () => _i22.PasswordResetBloc(
          get<_i21.PasswordReset>(), get<_i4.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i23.PickImage>(() => _i23.PickImage(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i24.PickVideo>(() => _i24.PickVideo(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i25.SendEmailVerification>(
      () => _i25.SendEmailVerification(get<_i15.IUserFacade>()),
      registerFor: {_prod, _dev, _send_email_verification_test_env});
  gh.lazySingleton<_i26.SetLocale>(
      () =>
          _i26.SetLocale(get<_i15.IUserFacade>(), get<_i17.IUserRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i27.SignOut>(() => _i27.SignOut(get<_i15.IUserFacade>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i28.SignUp>(() => _i28.SignUp(get<_i17.IUserRepository>()),
      registerFor: {_prod, _dev, _sign_up_test_env});
  gh.factory<_i29.TechniqueDetailBloc>(() => _i29.TechniqueDetailBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i30.TechniqueLocalDataSource>(
      () => _i30.TechniqueLocalDataSource(),
      registerFor: {_prod});
  gh.factory<_i31.ThumbnailPickerBloc>(
      () => _i31.ThumbnailPickerBloc(get<_i23.PickImage>()),
      registerFor: {_prod, _dev});
  gh.factory<_i32.ToggleSwitchBloc>(() => _i32.ToggleSwitchBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i33.UpdateCategory>(
      () => _i33.UpdateCategory(get<_i9.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i34.UpdateTechnique>(
      () => _i34.UpdateTechnique(get<_i13.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i35.UserSectionNavigationBloc>(
      () => _i35.UserSectionNavigationBloc(),
      registerFor: {_prod, _dev});
  gh.factory<_i36.VideoPickerBloc>(
      () => _i36.VideoPickerBloc(get<_i24.PickVideo>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i37.CreateCategory>(
      () => _i37.CreateCategory(get<_i9.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i38.CreateTechnique>(
      () => _i38.CreateTechnique(get<_i13.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i39.EmailAuthentication>(
      () => _i39.EmailAuthentication(get<_i17.IUserRepository>()),
      registerFor: {_prod, _dev, _email_authentication_test_env});
  gh.lazySingleton<_i40.EmailIsVerified>(
      () => _i40.EmailIsVerified(get<_i15.IUserFacade>()),
      registerFor: {_prod, _dev, _email_verification_check_test_env});
  gh.lazySingleton<_i41.FacebookAuthentication>(
      () => _i41.FacebookAuthentication(get<_i17.IUserRepository>()),
      registerFor: {_prod, _dev, _facebook_authentication_test_env});
  gh.lazySingleton<_i42.GetAllCategories>(
      () => _i42.GetAllCategories(get<_i9.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i43.GetAllTechniques>(
      () => _i43.GetAllTechniques(get<_i13.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i44.GetAuthProviders>(
      () => _i44.GetAuthProviders(get<_i17.IUserRepository>()),
      registerFor: {_prod, _dev, _get_authentication_providers_test_env});
  gh.lazySingleton<_i45.GetCategories>(
      () => _i45.GetCategories(get<_i11.ICategoryRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i46.GetCategoryLocalizedData>(
      () => _i46.GetCategoryLocalizedData(get<_i9.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i47.GetCurrentUser>(
      () => _i47.GetCurrentUser(get<_i17.IUserRepository>()),
      registerFor: {_prod, _dev, _get_current_user_test_env});
  gh.lazySingleton<_i48.GetHiddenCategories>(
      () => _i48.GetHiddenCategories(get<_i9.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i49.GetTechniqueLocalizedData>(
      () =>
          _i49.GetTechniqueLocalizedData(get<_i13.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i50.GetVisibleCategories>(
      () => _i50.GetVisibleCategories(get<_i9.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i51.GoogleAuthentication>(
      () => _i51.GoogleAuthentication(get<_i17.IUserRepository>()),
      registerFor: {_prod, _dev, _google_authentication_test_env});
  gh.factory<_i52.HiddenCategoriesBloc>(
      () => _i52.HiddenCategoriesBloc(get<_i48.GetHiddenCategories>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i53.ITechniqueRepository>(
      () => _i54.TechniqueRepository(get<_i7.FirebaseUserSectionDataSource>(),
          get<_i30.TechniqueLocalDataSource>()),
      registerFor: {_prod});
  gh.factoryParam<_i55.TechniqueFormBloc, _i55.TechniqueFormState?, dynamic>(
      (initialState, _) => _i55.TechniqueFormBloc(
          initialState,
          get<_i42.GetAllCategories>(),
          get<_i38.CreateTechnique>(),
          get<_i34.UpdateTechnique>(),
          get<_i4.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i56.TechniqueListBloc>(
      () => _i56.TechniqueListBloc(get<_i43.GetAllTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i57.TechniqueLocalizationBloc>(
      () =>
          _i57.TechniqueLocalizationBloc(get<_i49.GetTechniqueLocalizedData>()),
      registerFor: {_prod, _dev});
  gh.factory<_i58.ThirdPartyAuthBloc>(
      () => _i58.ThirdPartyAuthBloc(
          get<_i41.FacebookAuthentication>(),
          get<_i51.GoogleAuthentication>(),
          get<_i44.GetAuthProviders>(),
          get<_i20.LinkFacebookProvider>()),
      registerFor: {_prod, _dev});
  gh.factory<_i59.VisibleCategoriesBloc>(
      () => _i59.VisibleCategoriesBloc(get<_i50.GetVisibleCategories>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i60.AuthBloc>(
      () => _i60.AuthBloc(
          get<_i47.GetCurrentUser>(),
          get<_i40.EmailIsVerified>(),
          get<_i26.SetLocale>(),
          get<_i27.SignOut>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i61.CategoriesBloc>(
      () => _i61.CategoriesBloc(get<_i45.GetCategories>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i62.CategoryFormBloc, _i62.CategoryFormState?, dynamic>(
      (initialState, _) => _i62.CategoryFormBloc(
          initialState, get<_i37.CreateCategory>(), get<_i33.UpdateCategory>()),
      registerFor: {_prod, _dev});
  gh.factory<_i63.CategoryLocalizationBloc>(
      () => _i63.CategoryLocalizationBloc(get<_i46.GetCategoryLocalizedData>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i64.DeleteDownloadedTechnique>(
      () => _i64.DeleteDownloadedTechnique(get<_i53.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i65.DownloadTechnique>(
      () => _i65.DownloadTechnique(get<_i53.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i66.EmailAuthBloc>(
      () => _i66.EmailAuthBloc(
          get<_i39.EmailAuthentication>(), get<_i4.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i67.EmailVerificationBloc>(
      () => _i67.EmailVerificationBloc(
          get<_i27.SignOut>(),
          get<_i25.SendEmailVerification>(),
          get<_i40.EmailIsVerified>(),
          get<_i4.ErrorBloc>(),
          get<_i60.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i68.GetDownloadedTechniques>(
      () => _i68.GetDownloadedTechniques(get<_i53.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i69.GetMostRecentTechniques>(
      () => _i69.GetMostRecentTechniques(get<_i53.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i70.GetTechniqueById>(
      () => _i70.GetTechniqueById(get<_i53.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i71.GetTechniques>(
      () => _i71.GetTechniques(get<_i53.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i72.GetTechniquesByCategory>(
      () => _i72.GetTechniquesByCategory(get<_i53.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i73.MostRecentTechniquesBloc>(
      () => _i73.MostRecentTechniquesBloc(get<_i69.GetMostRecentTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i74.SignUpBloc>(
      () => _i74.SignUpBloc(
          get<_i28.SignUp>(),
          get<_i44.GetAuthProviders>(),
          get<_i19.LinkEmailProvider>(),
          get<_i4.ErrorBloc>(),
          get<_i60.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i75.TechniqueBloc>(
      () => _i75.TechniqueBloc(get<_i70.GetTechniqueById>()),
      registerFor: {_prod, _dev});
  gh.factory<_i76.CategoryDetailBloc>(
      () => _i76.CategoryDetailBloc(get<_i72.GetTechniquesByCategory>()),
      registerFor: {_prod, _dev});
  gh.singleton<_i77.TechniqueLocalStorageBloc>(
      _i77.TechniqueLocalStorageBloc(
          get<_i65.DownloadTechnique>(),
          get<_i68.GetDownloadedTechniques>(),
          get<_i64.DeleteDownloadedTechnique>()),
      registerFor: {_prod, _dev});
  return get;
}
