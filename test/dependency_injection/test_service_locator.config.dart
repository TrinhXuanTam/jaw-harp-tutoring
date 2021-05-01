// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jews_harp/core/BLoCs/connectivity/connectivity_bloc.dart'
    as _i4;
import 'package:jews_harp/core/BLoCs/errors/error_bloc.dart' as _i5;
import 'package:jews_harp/core/BLoCs/hide_field_input/hide_field_input_bloc.dart'
    as _i11;
import 'package:jews_harp/core/BLoCs/toggle_switch/toggle_switch_bloc.dart'
    as _i36;
import 'package:jews_harp/features/admin/application/use_cases/create_category.dart'
    as _i42;
import 'package:jews_harp/features/admin/application/use_cases/create_technique.dart'
    as _i43;
import 'package:jews_harp/features/admin/application/use_cases/get_all_categories.dart'
    as _i48;
import 'package:jews_harp/features/admin/application/use_cases/get_all_techniques.dart'
    as _i49;
import 'package:jews_harp/features/admin/application/use_cases/get_category_localized_data.dart'
    as _i52;
import 'package:jews_harp/features/admin/application/use_cases/get_hidden_categories.dart'
    as _i54;
import 'package:jews_harp/features/admin/application/use_cases/get_technique_localized_data.dart'
    as _i55;
import 'package:jews_harp/features/admin/application/use_cases/get_visible_categories.dart'
    as _i56;
import 'package:jews_harp/features/admin/application/use_cases/pick_image.dart'
    as _i27;
import 'package:jews_harp/features/admin/application/use_cases/pick_video.dart'
    as _i28;
import 'package:jews_harp/features/admin/application/use_cases/update_category.dart'
    as _i37;
import 'package:jews_harp/features/admin/application/use_cases/update_technique.dart'
    as _i38;
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart'
    as _i12;
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart'
    as _i16;
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart'
    as _i6;
import 'package:jews_harp/features/admin/infrastructure/repositories/category_admin_repository.dart'
    as _i13;
import 'package:jews_harp/features/admin/infrastructure/repositories/technique_admin_repository.dart'
    as _i17;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_detail/category_detail_bloc.dart'
    as _i89;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart'
    as _i77;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_localization/category_localization_bloc.dart'
    as _i78;
import 'package:jews_harp/features/admin/presentation/BLoCs/hidden_categories/hidden_categories_bloc.dart'
    as _i58;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_form/technique_form_bloc.dart'
    as _i71;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_list/technique_list_bloc.dart'
    as _i72;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_localization/technique_localization_bloc.dart'
    as _i73;
import 'package:jews_harp/features/admin/presentation/BLoCs/thumbnail_picker/thumbnail_picker_bloc.dart'
    as _i35;
import 'package:jews_harp/features/admin/presentation/BLoCs/video_picker/video_picker_bloc.dart'
    as _i40;
import 'package:jews_harp/features/admin/presentation/BLoCs/visible_categories/visible_categories_bloc.dart'
    as _i75;
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart'
    as _i44;
import 'package:jews_harp/features/auth/application/use_cases/facebook_authentication.dart'
    as _i47;
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart'
    as _i50;
import 'package:jews_harp/features/auth/application/use_cases/get_current_user.dart'
    as _i53;
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart'
    as _i57;
import 'package:jews_harp/features/auth/application/use_cases/link_email_provider.dart'
    as _i22;
import 'package:jews_harp/features/auth/application/use_cases/link_facebook_provider.dart'
    as _i23;
import 'package:jews_harp/features/auth/application/use_cases/password_reset.dart'
    as _i24;
import 'package:jews_harp/features/auth/application/use_cases/reload_user.dart'
    as _i29;
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart'
    as _i30;
import 'package:jews_harp/features/auth/application/use_cases/set_locale.dart'
    as _i31;
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart'
    as _i32;
import 'package:jews_harp/features/auth/application/use_cases/sign_up.dart'
    as _i33;
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart'
    as _i18;
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart'
    as _i20;
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart'
    as _i7;
import 'package:jews_harp/features/auth/infrastructure/external_services/firebase_auth.dart'
    as _i9;
import 'package:jews_harp/features/auth/infrastructure/facades/user_facade.dart'
    as _i19;
import 'package:jews_harp/features/auth/infrastructure/repositories/user_repository.dart'
    as _i21;
import 'package:jews_harp/features/auth/presentation/BLoCs/auth_state/auth_bloc.dart'
    as _i41;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_form/email_form_bloc.dart'
    as _i45;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart'
    as _i46;
import 'package:jews_harp/features/auth/presentation/BLoCs/link_providers/link_providers_bloc.dart'
    as _i63;
import 'package:jews_harp/features/auth/presentation/BLoCs/password_reset/password_reset_bloc.dart'
    as _i25;
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart'
    as _i68;
import 'package:jews_harp/features/auth/presentation/BLoCs/splash_screen/splash_screen_bloc.dart'
    as _i69;
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart'
    as _i74;
import 'package:jews_harp/features/user_section/application/delete_downloaded_technique.dart'
    as _i79;
import 'package:jews_harp/features/user_section/application/download_technique.dart'
    as _i80;
import 'package:jews_harp/features/user_section/application/get_categories.dart'
    as _i51;
import 'package:jews_harp/features/user_section/application/get_downloaded_techniques.dart'
    as _i81;
import 'package:jews_harp/features/user_section/application/get_most_recent_techniques.dart'
    as _i82;
import 'package:jews_harp/features/user_section/application/get_technique_by_Id.dart'
    as _i83;
import 'package:jews_harp/features/user_section/application/get_techniques.dart'
    as _i84;
import 'package:jews_harp/features/user_section/application/get_techniques_by_category.dart'
    as _i85;
import 'package:jews_harp/features/user_section/application/mark_technique_as_favorite.dart'
    as _i64;
import 'package:jews_harp/features/user_section/application/purchase_technique.dart'
    as _i65;
import 'package:jews_harp/features/user_section/application/remove_technique_from_favorites.dart'
    as _i67;
import 'package:jews_harp/features/user_section/domain/facade_interfaces/user_section_facade.dart'
    as _i61;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/category_repository.dart'
    as _i14;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart'
    as _i59;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/category_local_data_source.dart'
    as _i3;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart'
    as _i10;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/technique_local_data_source.dart'
    as _i34;
import 'package:jews_harp/features/user_section/infrastructure/external_services/payment_service.dart'
    as _i26;
import 'package:jews_harp/features/user_section/infrastructure/facades/user_section_facade.dart'
    as _i62;
import 'package:jews_harp/features/user_section/infrastructure/repositories/category_repository.dart'
    as _i15;
import 'package:jews_harp/features/user_section/infrastructure/repositories/technique_repository.dart'
    as _i60;
import 'package:jews_harp/features/user_section/presentation/BLoCs/categories/categories_bloc.dart'
    as _i76;
import 'package:jews_harp/features/user_section/presentation/BLoCs/most_recent_techniques/most_recent_techniques_bloc.dart'
    as _i86;
import 'package:jews_harp/features/user_section/presentation/BLoCs/purchase_technique/purchase_technique_bloc.dart'
    as _i66;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique/technique_bloc.dart'
    as _i87;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_detail/technique_detail_bloc.dart'
    as _i70;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_local_storage/technique_local_storage_bloc.dart'
    as _i88;
import 'package:jews_harp/features/user_section/presentation/BLoCs/user_section_navigation/user_section_navigation_bloc.dart'
    as _i39;

import 'mock.dart' as _i8;

const String _prod = 'prod';
const String _dev = 'dev';
const String _user_repository_test_env = 'user_repository_test_env';
const String _email_authentication_test_env = 'email_authentication_test_env';
const String _get_current_user_test_env = 'get_current_user_test_env';
const String _sign_up_test_env = 'sign_up_test_env';
const String _facebook_authentication_test_env =
    'facebook_authentication_test_env';
const String _google_authentication_test_env = 'google_authentication_test_env';
const String _get_authentication_providers_test_env =
    'get_authentication_providers_test_env';
const String _email_verification_check_test_env =
    'email_verification_check_test_env';
const String _link_email_provider_test_env = 'link_email_provider_test_env';
const String _link_facebook_provider_test_env =
    'link_facebook_provider_test_env';
const String _password_reset_test_env = 'password_reset_test_env';
const String _send_email_verification_test_env =
    'send_email_verification_test_env';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt testInitGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.CategoryLocalDataSource>(
      () => _i3.CategoryLocalDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i4.ConnectivityBloc>(() => _i4.ConnectivityBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i5.ErrorBloc>(() => _i5.ErrorBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i6.FirebaseAdminDataSource>(
      () => _i6.FirebaseAdminDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i7.FirebaseAuthDataSource>(
      () => _i8.FirebaseAuthDataSourceMock(),
      registerFor: {_user_repository_test_env});
  gh.lazySingleton<_i7.FirebaseAuthDataSource>(
      () => _i7.FirebaseAuthDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i9.FirebaseAuthService>(() => _i9.FirebaseAuthService(),
      registerFor: {_prod});
  gh.lazySingleton<_i10.FirebaseUserSectionDataSource>(
      () => _i10.FirebaseUserSectionDataSource(),
      registerFor: {_prod});
  gh.factory<_i11.HideFieldInputBloc>(() => _i11.HideFieldInputBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i12.ICategoryAdminRepository>(
      () => _i13.CategoryAdminRepository(get<_i6.FirebaseAdminDataSource>(),
          get<_i10.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i14.ICategoryRepository>(
      () => _i15.CategoryRepository(get<_i10.FirebaseUserSectionDataSource>(),
          get<_i3.CategoryLocalDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i16.ITechniqueAdminRepository>(
      () => _i17.TechniqueAdminRepository(get<_i6.FirebaseAdminDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i18.IUserAuthFacade>(
      () => _i19.UserAuthFacade(get<_i9.FirebaseAuthService>()),
      registerFor: {_prod});
  gh.lazySingleton<_i20.IUserAuthRepository>(() => _i8.IUserRepositoryMock(),
      registerFor: {
        _email_authentication_test_env,
        _get_current_user_test_env,
        _sign_up_test_env,
        _facebook_authentication_test_env,
        _google_authentication_test_env,
        _get_authentication_providers_test_env
      });
  gh.lazySingleton<_i20.IUserAuthRepository>(
      () => _i21.UserAuthRepository(get<_i7.FirebaseAuthDataSource>()),
      registerFor: {_prod, _user_repository_test_env});
  gh.lazySingleton<_i8.IUserFacadeMock>(() => _i8.IUserFacadeMock(),
      registerFor: {
        _email_authentication_test_env,
        _get_current_user_test_env,
        _sign_up_test_env,
        _email_verification_check_test_env,
        _link_email_provider_test_env,
        _link_facebook_provider_test_env,
        _password_reset_test_env,
        _send_email_verification_test_env
      });
  gh.lazySingleton<_i22.LinkEmailProvider>(
      () => _i22.LinkEmailProvider(get<_i18.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _link_email_provider_test_env});
  gh.lazySingleton<_i23.LinkFacebookProvider>(
      () => _i23.LinkFacebookProvider(get<_i18.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _link_facebook_provider_test_env});
  gh.lazySingleton<_i24.PasswordReset>(
      () => _i24.PasswordReset(get<_i18.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _password_reset_test_env});
  gh.factory<_i25.PasswordResetBloc>(
      () => _i25.PasswordResetBloc(get<_i24.PasswordReset>(),
          get<_i4.ConnectivityBloc>(), get<_i5.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i26.PaymentService>(() => _i26.PaymentService(),
      registerFor: {_prod});
  gh.lazySingleton<_i27.PickImage>(() => _i27.PickImage(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i28.PickVideo>(() => _i28.PickVideo(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i29.ReloadUser>(
      () => _i29.ReloadUser(get<_i20.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _email_verification_check_test_env});
  gh.lazySingleton<_i30.SendEmailVerification>(
      () => _i30.SendEmailVerification(get<_i18.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _send_email_verification_test_env});
  gh.lazySingleton<_i31.SetLocale>(
      () => _i31.SetLocale(get<_i18.IUserAuthFacade>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i32.SignOut>(
      () => _i32.SignOut(get<_i18.IUserAuthFacade>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i33.SignUp>(() => _i33.SignUp(get<_i18.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _sign_up_test_env});
  gh.lazySingleton<_i34.TechniqueLocalDataSource>(
      () => _i34.TechniqueLocalDataSource(),
      registerFor: {_prod});
  gh.factory<_i35.ThumbnailPickerBloc>(
      () => _i35.ThumbnailPickerBloc(get<_i27.PickImage>()),
      registerFor: {_prod, _dev});
  gh.factory<_i36.ToggleSwitchBloc>(() => _i36.ToggleSwitchBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i37.UpdateCategory>(
      () => _i37.UpdateCategory(get<_i12.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i38.UpdateTechnique>(
      () => _i38.UpdateTechnique(get<_i16.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i39.UserSectionNavigationBloc>(
      () => _i39.UserSectionNavigationBloc(),
      registerFor: {_prod, _dev});
  gh.factory<_i40.VideoPickerBloc>(
      () => _i40.VideoPickerBloc(get<_i28.PickVideo>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i41.AuthBloc>(
      () => _i41.AuthBloc(get<_i29.ReloadUser>(), get<_i32.SignOut>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i42.CreateCategory>(
      () => _i42.CreateCategory(get<_i12.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i43.CreateTechnique>(
      () => _i43.CreateTechnique(get<_i16.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i44.EmailAuthentication>(
      () => _i44.EmailAuthentication(get<_i18.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _email_authentication_test_env});
  gh.factory<_i45.EmailFormBloc>(() => _i45.EmailFormBloc(
      get<_i44.EmailAuthentication>(),
      get<_i4.ConnectivityBloc>(),
      get<_i5.ErrorBloc>(),
      get<_i41.AuthBloc>()));
  gh.factory<_i46.EmailVerificationBloc>(
      () => _i46.EmailVerificationBloc(
          get<_i32.SignOut>(),
          get<_i30.SendEmailVerification>(),
          get<_i4.ConnectivityBloc>(),
          get<_i29.ReloadUser>(),
          get<_i5.ErrorBloc>(),
          get<_i41.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i47.FacebookAuthentication>(
      () => _i47.FacebookAuthentication(get<_i18.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _facebook_authentication_test_env});
  gh.lazySingleton<_i48.GetAllCategories>(
      () => _i48.GetAllCategories(get<_i12.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i49.GetAllTechniques>(
      () => _i49.GetAllTechniques(get<_i16.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i50.GetAuthProviders>(
      () => _i50.GetAuthProviders(get<_i20.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _get_authentication_providers_test_env});
  gh.lazySingleton<_i51.GetCategories>(
      () => _i51.GetCategories(get<_i14.ICategoryRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i52.GetCategoryLocalizedData>(
      () => _i52.GetCategoryLocalizedData(get<_i12.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i53.GetCurrentUser>(
      () => _i53.GetCurrentUser(get<_i20.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _get_current_user_test_env});
  gh.lazySingleton<_i54.GetHiddenCategories>(
      () => _i54.GetHiddenCategories(get<_i12.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i55.GetTechniqueLocalizedData>(
      () =>
          _i55.GetTechniqueLocalizedData(get<_i16.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i56.GetVisibleCategories>(
      () => _i56.GetVisibleCategories(get<_i12.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i57.GoogleAuthentication>(
      () => _i57.GoogleAuthentication(get<_i18.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _google_authentication_test_env});
  gh.factory<_i58.HiddenCategoriesBloc>(
      () => _i58.HiddenCategoriesBloc(get<_i54.GetHiddenCategories>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i59.ITechniqueRepository>(
      () => _i60.TechniqueRepository(get<_i10.FirebaseUserSectionDataSource>(),
          get<_i34.TechniqueLocalDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i61.IUserSectionFacade>(
      () => _i62.UserSectionFacade(get<_i26.PaymentService>(),
          get<_i10.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.factoryParam<_i63.LinkProvidersBloc, _i63.LinkProvidersState?, dynamic>(
      (initialState, _) => _i63.LinkProvidersBloc(
          initialState,
          get<_i47.FacebookAuthentication>(),
          get<_i57.GoogleAuthentication>(),
          get<_i44.EmailAuthentication>(),
          get<_i23.LinkFacebookProvider>(),
          get<_i22.LinkEmailProvider>(),
          get<_i32.SignOut>(),
          get<_i5.ErrorBloc>(),
          get<_i41.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i64.MarkTechniqueAsFavorite>(
      () => _i64.MarkTechniqueAsFavorite(get<_i61.IUserSectionFacade>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i65.PurchaseTechnique>(
      () => _i65.PurchaseTechnique(get<_i61.IUserSectionFacade>()),
      registerFor: {_prod, _dev});
  gh.factory<_i66.PurchaseTechniqueBloc>(
      () => _i66.PurchaseTechniqueBloc(
          get<_i65.PurchaseTechnique>(), get<_i5.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i67.RemoveTechniqueFromFavorites>(
      () => _i67.RemoveTechniqueFromFavorites(get<_i61.IUserSectionFacade>()),
      registerFor: {_prod, _dev});
  gh.factory<_i68.SignUpBloc>(
      () => _i68.SignUpBloc(
          get<_i33.SignUp>(),
          get<_i50.GetAuthProviders>(),
          get<_i4.ConnectivityBloc>(),
          get<_i5.ErrorBloc>(),
          get<_i41.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i69.SplashScreenBloc>(
      () => _i69.SplashScreenBloc(get<_i53.GetCurrentUser>(),
          get<_i31.SetLocale>(), get<_i41.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i70.TechniqueDetailBloc>(
      () => _i70.TechniqueDetailBloc(get<_i64.MarkTechniqueAsFavorite>(),
          get<_i67.RemoveTechniqueFromFavorites>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i71.TechniqueFormBloc, _i71.TechniqueFormState?, dynamic>(
      (initialState, _) => _i71.TechniqueFormBloc(
          initialState,
          get<_i48.GetAllCategories>(),
          get<_i43.CreateTechnique>(),
          get<_i38.UpdateTechnique>(),
          get<_i5.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i72.TechniqueListBloc>(
      () => _i72.TechniqueListBloc(get<_i49.GetAllTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i73.TechniqueLocalizationBloc>(
      () =>
          _i73.TechniqueLocalizationBloc(get<_i55.GetTechniqueLocalizedData>()),
      registerFor: {_prod, _dev});
  gh.factory<_i74.ThirdPartyAuthBloc>(
      () => _i74.ThirdPartyAuthBloc(
          get<_i47.FacebookAuthentication>(),
          get<_i57.GoogleAuthentication>(),
          get<_i50.GetAuthProviders>(),
          get<_i41.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i75.VisibleCategoriesBloc>(
      () => _i75.VisibleCategoriesBloc(get<_i56.GetVisibleCategories>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i76.CategoriesBloc>(
      () => _i76.CategoriesBloc(get<_i51.GetCategories>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i77.CategoryFormBloc, _i77.CategoryFormState?, dynamic>(
      (initialState, _) => _i77.CategoryFormBloc(
          initialState, get<_i42.CreateCategory>(), get<_i37.UpdateCategory>()),
      registerFor: {_prod, _dev});
  gh.factory<_i78.CategoryLocalizationBloc>(
      () => _i78.CategoryLocalizationBloc(get<_i52.GetCategoryLocalizedData>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i79.DeleteDownloadedTechnique>(
      () => _i79.DeleteDownloadedTechnique(get<_i59.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i80.DownloadTechnique>(
      () => _i80.DownloadTechnique(get<_i59.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i81.GetDownloadedTechniques>(
      () => _i81.GetDownloadedTechniques(get<_i59.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i82.GetMostRecentTechniques>(
      () => _i82.GetMostRecentTechniques(get<_i59.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i83.GetTechniqueById>(
      () => _i83.GetTechniqueById(get<_i59.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i84.GetTechniques>(
      () => _i84.GetTechniques(get<_i59.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i85.GetTechniquesByCategory>(
      () => _i85.GetTechniquesByCategory(get<_i59.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i86.MostRecentTechniquesBloc>(
      () => _i86.MostRecentTechniquesBloc(get<_i82.GetMostRecentTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i87.TechniqueBloc>(
      () => _i87.TechniqueBloc(get<_i83.GetTechniqueById>()),
      registerFor: {_prod, _dev});
  gh.factory<_i88.TechniqueLocalStorageBloc>(
      () => _i88.TechniqueLocalStorageBloc(
          get<_i80.DownloadTechnique>(),
          get<_i81.GetDownloadedTechniques>(),
          get<_i79.DeleteDownloadedTechnique>()),
      registerFor: {_prod, _dev});
  gh.factory<_i89.CategoryDetailBloc>(
      () => _i89.CategoryDetailBloc(get<_i85.GetTechniquesByCategory>()),
      registerFor: {_prod, _dev});
  return get;
}
