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
    as _i40;
import 'package:jews_harp/features/admin/application/use_cases/create_category.dart'
    as _i45;
import 'package:jews_harp/features/admin/application/use_cases/create_technique.dart'
    as _i46;
import 'package:jews_harp/features/admin/application/use_cases/get_all_categories.dart'
    as _i49;
import 'package:jews_harp/features/admin/application/use_cases/get_all_techniques.dart'
    as _i50;
import 'package:jews_harp/features/admin/application/use_cases/get_category_localized_data.dart'
    as _i53;
import 'package:jews_harp/features/admin/application/use_cases/get_hidden_categories.dart'
    as _i55;
import 'package:jews_harp/features/admin/application/use_cases/get_technique_localized_data.dart'
    as _i56;
import 'package:jews_harp/features/admin/application/use_cases/get_visible_categories.dart'
    as _i57;
import 'package:jews_harp/features/admin/application/use_cases/pick_image.dart'
    as _i29;
import 'package:jews_harp/features/admin/application/use_cases/pick_video.dart'
    as _i30;
import 'package:jews_harp/features/admin/application/use_cases/update_category.dart'
    as _i41;
import 'package:jews_harp/features/admin/application/use_cases/update_technique.dart'
    as _i42;
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart'
    as _i10;
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart'
    as _i16;
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart'
    as _i5;
import 'package:jews_harp/features/admin/infrastructure/repositories/category_admin_repository.dart'
    as _i11;
import 'package:jews_harp/features/admin/infrastructure/repositories/technique_admin_repository.dart'
    as _i17;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_detail/category_detail_bloc.dart'
    as _i86;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart'
    as _i68;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_localization/category_localization_bloc.dart'
    as _i69;
import 'package:jews_harp/features/admin/presentation/BLoCs/hidden_categories/hidden_categories_bloc.dart'
    as _i59;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_form/technique_form_bloc.dart'
    as _i62;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_list/technique_list_bloc.dart'
    as _i63;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_localization/technique_localization_bloc.dart'
    as _i64;
import 'package:jews_harp/features/admin/presentation/BLoCs/thumbnail_picker/thumbnail_picker_bloc.dart'
    as _i39;
import 'package:jews_harp/features/admin/presentation/BLoCs/video_picker/video_picker_bloc.dart'
    as _i44;
import 'package:jews_harp/features/admin/presentation/BLoCs/visible_categories/visible_categories_bloc.dart'
    as _i65;
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart'
    as _i47;
import 'package:jews_harp/features/auth/application/use_cases/facebook_authentication.dart'
    as _i48;
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart'
    as _i51;
import 'package:jews_harp/features/auth/application/use_cases/get_current_user.dart'
    as _i54;
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart'
    as _i58;
import 'package:jews_harp/features/auth/application/use_cases/link_email_provider.dart'
    as _i24;
import 'package:jews_harp/features/auth/application/use_cases/link_facebook_provider.dart'
    as _i25;
import 'package:jews_harp/features/auth/application/use_cases/password_reset.dart'
    as _i27;
import 'package:jews_harp/features/auth/application/use_cases/reload_user.dart'
    as _i31;
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart'
    as _i33;
import 'package:jews_harp/features/auth/application/use_cases/set_locale.dart'
    as _i34;
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart'
    as _i35;
import 'package:jews_harp/features/auth/application/use_cases/sign_up.dart'
    as _i36;
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart'
    as _i20;
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart'
    as _i18;
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart'
    as _i6;
import 'package:jews_harp/features/auth/infrastructure/external_services/firebase_auth.dart'
    as _i7;
import 'package:jews_harp/features/auth/infrastructure/facades/user_facade.dart'
    as _i21;
import 'package:jews_harp/features/auth/infrastructure/repositories/user_repository.dart'
    as _i19;
import 'package:jews_harp/features/auth/presentation/BLoCs/auth_state/auth_bloc.dart'
    as _i66;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_form/email_form_bloc.dart'
    as _i72;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart'
    as _i73;
import 'package:jews_harp/features/auth/presentation/BLoCs/link_providers/link_providers_bloc.dart'
    as _i79;
import 'package:jews_harp/features/auth/presentation/BLoCs/password_reset/password_reset_bloc.dart'
    as _i28;
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart'
    as _i81;
import 'package:jews_harp/features/auth/presentation/BLoCs/splash_screen/splash_screen_bloc.dart'
    as _i82;
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart'
    as _i85;
import 'package:jews_harp/features/user_section/application/delete_downloaded_technique.dart'
    as _i70;
import 'package:jews_harp/features/user_section/application/download_technique.dart'
    as _i71;
import 'package:jews_harp/features/user_section/application/get_categories.dart'
    as _i52;
import 'package:jews_harp/features/user_section/application/get_downloaded_techniques.dart'
    as _i74;
import 'package:jews_harp/features/user_section/application/get_most_recent_techniques.dart'
    as _i75;
import 'package:jews_harp/features/user_section/application/get_technique_by_Id.dart'
    as _i76;
import 'package:jews_harp/features/user_section/application/get_techniques.dart'
    as _i77;
import 'package:jews_harp/features/user_section/application/get_techniques_by_category.dart'
    as _i78;
import 'package:jews_harp/features/user_section/application/mark_technique_as_favorite.dart'
    as _i26;
import 'package:jews_harp/features/user_section/application/remove_technique_from_favorites.dart'
    as _i32;
import 'package:jews_harp/features/user_section/domain/facade_interfaces/payment_facade.dart'
    as _i14;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/category_repository.dart'
    as _i12;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart'
    as _i60;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/user_repository.dart'
    as _i22;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/category_local_data_source.dart'
    as _i3;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart'
    as _i8;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/technique_local_data_source.dart'
    as _i38;
import 'package:jews_harp/features/user_section/infrastructure/facades/payment_facade.dart'
    as _i15;
import 'package:jews_harp/features/user_section/infrastructure/repositories/category_repository.dart'
    as _i13;
import 'package:jews_harp/features/user_section/infrastructure/repositories/technique_repository.dart'
    as _i61;
import 'package:jews_harp/features/user_section/infrastructure/repositories/user_repository.dart'
    as _i23;
import 'package:jews_harp/features/user_section/presentation/BLoCs/categories/categories_bloc.dart'
    as _i67;
import 'package:jews_harp/features/user_section/presentation/BLoCs/most_recent_techniques/most_recent_techniques_bloc.dart'
    as _i80;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique/technique_bloc.dart'
    as _i83;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_detail/technique_detail_bloc.dart'
    as _i37;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_local_storage/technique_local_storage_bloc.dart'
    as _i84;
import 'package:jews_harp/features/user_section/presentation/BLoCs/user_section_navigation/user_section_navigation_bloc.dart'
    as _i43;

const String _prod = 'prod';
const String _dev = 'dev';
const String _user_repository_test_env = 'user_repository_test_env';
const String _link_email_provider_test_env = 'link_email_provider_test_env';
const String _link_facebook_provider_test_env =
    'link_facebook_provider_test_env';
const String _password_reset_test_env = 'password_reset_test_env';
const String _email_verification_check_test_env =
    'email_verification_check_test_env';
const String _send_email_verification_test_env =
    'send_email_verification_test_env';
const String _sign_up_test_env = 'sign_up_test_env';
const String _email_authentication_test_env = 'email_authentication_test_env';
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
  gh.lazySingleton<_i7.FirebaseAuthService>(() => _i7.FirebaseAuthService(),
      registerFor: {_prod});
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
      () => _i13.CategoryRepository(get<_i8.FirebaseUserSectionDataSource>(),
          get<_i3.CategoryLocalDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i14.IPaymentFacade>(() => _i15.PaymentFacade(),
      registerFor: {_prod});
  gh.lazySingleton<_i16.ITechniqueAdminRepository>(
      () => _i17.TechniqueAdminRepository(get<_i5.FirebaseAdminDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i18.IUserAuthRepository>(
      () => _i19.UserAuthRepository(get<_i6.FirebaseAuthDataSource>()),
      registerFor: {_prod, _user_repository_test_env});
  gh.lazySingleton<_i20.IUserFacade>(
      () => _i21.FirebaseAuthFacade(get<_i7.FirebaseAuthService>()),
      registerFor: {_prod});
  gh.lazySingleton<_i22.IUserRepository>(
      () => _i23.UserRepository(get<_i8.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i24.LinkEmailProvider>(
      () => _i24.LinkEmailProvider(get<_i20.IUserFacade>()),
      registerFor: {_prod, _dev, _link_email_provider_test_env});
  gh.lazySingleton<_i25.LinkFacebookProvider>(
      () => _i25.LinkFacebookProvider(get<_i20.IUserFacade>()),
      registerFor: {_prod, _dev, _link_facebook_provider_test_env});
  gh.lazySingleton<_i26.MarkTechniqueAsFavorite>(
      () => _i26.MarkTechniqueAsFavorite(get<_i22.IUserRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i27.PasswordReset>(
      () => _i27.PasswordReset(get<_i20.IUserFacade>()),
      registerFor: {_prod, _dev, _password_reset_test_env});
  gh.factory<_i28.PasswordResetBloc>(
      () => _i28.PasswordResetBloc(
          get<_i27.PasswordReset>(), get<_i4.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i29.PickImage>(() => _i29.PickImage(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i30.PickVideo>(() => _i30.PickVideo(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i31.ReloadUser>(
      () => _i31.ReloadUser(get<_i18.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _email_verification_check_test_env});
  gh.lazySingleton<_i32.RemoveTechniqueFromFavorites>(
      () => _i32.RemoveTechniqueFromFavorites(get<_i22.IUserRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i33.SendEmailVerification>(
      () => _i33.SendEmailVerification(get<_i20.IUserFacade>()),
      registerFor: {_prod, _dev, _send_email_verification_test_env});
  gh.lazySingleton<_i34.SetLocale>(
      () => _i34.SetLocale(
          get<_i20.IUserFacade>(), get<_i18.IUserAuthRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i35.SignOut>(() => _i35.SignOut(get<_i20.IUserFacade>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i36.SignUp>(
      () => _i36.SignUp(get<_i18.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _sign_up_test_env});
  gh.factory<_i37.TechniqueDetailBloc>(
      () => _i37.TechniqueDetailBloc(get<_i26.MarkTechniqueAsFavorite>(),
          get<_i32.RemoveTechniqueFromFavorites>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i38.TechniqueLocalDataSource>(
      () => _i38.TechniqueLocalDataSource(),
      registerFor: {_prod});
  gh.factory<_i39.ThumbnailPickerBloc>(
      () => _i39.ThumbnailPickerBloc(get<_i29.PickImage>()),
      registerFor: {_prod, _dev});
  gh.factory<_i40.ToggleSwitchBloc>(() => _i40.ToggleSwitchBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i41.UpdateCategory>(
      () => _i41.UpdateCategory(get<_i10.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i42.UpdateTechnique>(
      () => _i42.UpdateTechnique(get<_i16.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i43.UserSectionNavigationBloc>(
      () => _i43.UserSectionNavigationBloc(),
      registerFor: {_prod, _dev});
  gh.factory<_i44.VideoPickerBloc>(
      () => _i44.VideoPickerBloc(get<_i30.PickVideo>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i45.CreateCategory>(
      () => _i45.CreateCategory(get<_i10.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i46.CreateTechnique>(
      () => _i46.CreateTechnique(get<_i16.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i47.EmailAuthentication>(
      () => _i47.EmailAuthentication(get<_i18.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _email_authentication_test_env});
  gh.lazySingleton<_i48.FacebookAuthentication>(
      () => _i48.FacebookAuthentication(get<_i18.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _facebook_authentication_test_env});
  gh.lazySingleton<_i49.GetAllCategories>(
      () => _i49.GetAllCategories(get<_i10.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i50.GetAllTechniques>(
      () => _i50.GetAllTechniques(get<_i16.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i51.GetAuthProviders>(
      () => _i51.GetAuthProviders(get<_i18.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _get_authentication_providers_test_env});
  gh.lazySingleton<_i52.GetCategories>(
      () => _i52.GetCategories(get<_i12.ICategoryRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i53.GetCategoryLocalizedData>(
      () => _i53.GetCategoryLocalizedData(get<_i10.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i54.GetCurrentUser>(
      () => _i54.GetCurrentUser(get<_i18.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _get_current_user_test_env});
  gh.lazySingleton<_i55.GetHiddenCategories>(
      () => _i55.GetHiddenCategories(get<_i10.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i56.GetTechniqueLocalizedData>(
      () =>
          _i56.GetTechniqueLocalizedData(get<_i16.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i57.GetVisibleCategories>(
      () => _i57.GetVisibleCategories(get<_i10.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i58.GoogleAuthentication>(
      () => _i58.GoogleAuthentication(get<_i18.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _google_authentication_test_env});
  gh.factory<_i59.HiddenCategoriesBloc>(
      () => _i59.HiddenCategoriesBloc(get<_i55.GetHiddenCategories>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i60.ITechniqueRepository>(
      () => _i61.TechniqueRepository(get<_i8.FirebaseUserSectionDataSource>(),
          get<_i38.TechniqueLocalDataSource>()),
      registerFor: {_prod});
  gh.factoryParam<_i62.TechniqueFormBloc, _i62.TechniqueFormState?, dynamic>(
      (initialState, _) => _i62.TechniqueFormBloc(
          initialState,
          get<_i49.GetAllCategories>(),
          get<_i46.CreateTechnique>(),
          get<_i42.UpdateTechnique>(),
          get<_i4.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i63.TechniqueListBloc>(
      () => _i63.TechniqueListBloc(get<_i50.GetAllTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i64.TechniqueLocalizationBloc>(
      () =>
          _i64.TechniqueLocalizationBloc(get<_i56.GetTechniqueLocalizedData>()),
      registerFor: {_prod, _dev});
  gh.factory<_i65.VisibleCategoriesBloc>(
      () => _i65.VisibleCategoriesBloc(get<_i57.GetVisibleCategories>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i66.AuthBloc>(
      () => _i66.AuthBloc(get<_i54.GetCurrentUser>(), get<_i35.SignOut>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i67.CategoriesBloc>(
      () => _i67.CategoriesBloc(get<_i52.GetCategories>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i68.CategoryFormBloc, _i68.CategoryFormState?, dynamic>(
      (initialState, _) => _i68.CategoryFormBloc(
          initialState, get<_i45.CreateCategory>(), get<_i41.UpdateCategory>()),
      registerFor: {_prod, _dev});
  gh.factory<_i69.CategoryLocalizationBloc>(
      () => _i69.CategoryLocalizationBloc(get<_i53.GetCategoryLocalizedData>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i70.DeleteDownloadedTechnique>(
      () => _i70.DeleteDownloadedTechnique(get<_i60.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i71.DownloadTechnique>(
      () => _i71.DownloadTechnique(get<_i60.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i72.EmailFormBloc>(() => _i72.EmailFormBloc(
      get<_i47.EmailAuthentication>(),
      get<_i4.ErrorBloc>(),
      get<_i66.AuthBloc>()));
  gh.factory<_i73.EmailVerificationBloc>(
      () => _i73.EmailVerificationBloc(
          get<_i35.SignOut>(),
          get<_i33.SendEmailVerification>(),
          get<_i31.ReloadUser>(),
          get<_i4.ErrorBloc>(),
          get<_i66.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i74.GetDownloadedTechniques>(
      () => _i74.GetDownloadedTechniques(get<_i60.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i75.GetMostRecentTechniques>(
      () => _i75.GetMostRecentTechniques(get<_i60.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i76.GetTechniqueById>(
      () => _i76.GetTechniqueById(get<_i60.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i77.GetTechniques>(
      () => _i77.GetTechniques(get<_i60.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i78.GetTechniquesByCategory>(
      () => _i78.GetTechniquesByCategory(get<_i60.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i79.LinkProvidersBloc, _i79.LinkProvidersState?, dynamic>(
      (initialState, _) => _i79.LinkProvidersBloc(
          initialState,
          get<_i48.FacebookAuthentication>(),
          get<_i58.GoogleAuthentication>(),
          get<_i47.EmailAuthentication>(),
          get<_i25.LinkFacebookProvider>(),
          get<_i24.LinkEmailProvider>(),
          get<_i35.SignOut>(),
          get<_i4.ErrorBloc>(),
          get<_i66.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i80.MostRecentTechniquesBloc>(
      () => _i80.MostRecentTechniquesBloc(get<_i75.GetMostRecentTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i81.SignUpBloc>(
      () => _i81.SignUpBloc(get<_i36.SignUp>(), get<_i51.GetAuthProviders>(),
          get<_i4.ErrorBloc>(), get<_i66.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i82.SplashScreenBloc>(
      () => _i82.SplashScreenBloc(get<_i54.GetCurrentUser>(),
          get<_i34.SetLocale>(), get<_i66.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i83.TechniqueBloc>(
      () => _i83.TechniqueBloc(get<_i76.GetTechniqueById>()),
      registerFor: {_prod, _dev});
  gh.factory<_i84.TechniqueLocalStorageBloc>(
      () => _i84.TechniqueLocalStorageBloc(
          get<_i71.DownloadTechnique>(),
          get<_i74.GetDownloadedTechniques>(),
          get<_i70.DeleteDownloadedTechnique>()),
      registerFor: {_prod, _dev});
  gh.factory<_i85.ThirdPartyAuthBloc>(
      () => _i85.ThirdPartyAuthBloc(
          get<_i48.FacebookAuthentication>(),
          get<_i58.GoogleAuthentication>(),
          get<_i51.GetAuthProviders>(),
          get<_i66.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i86.CategoryDetailBloc>(
      () => _i86.CategoryDetailBloc(get<_i78.GetTechniquesByCategory>()),
      registerFor: {_prod, _dev});
  return get;
}
