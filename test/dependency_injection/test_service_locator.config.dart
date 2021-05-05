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
    as _i12;
import 'package:jews_harp/core/BLoCs/toggle_switch/toggle_switch_bloc.dart'
    as _i50;
import 'package:jews_harp/features/admin/application/use_cases/create_category.dart'
    as _i56;
import 'package:jews_harp/features/admin/application/use_cases/create_technique.dart'
    as _i57;
import 'package:jews_harp/features/admin/application/use_cases/get_all_categories.dart'
    as _i62;
import 'package:jews_harp/features/admin/application/use_cases/get_all_techniques.dart'
    as _i63;
import 'package:jews_harp/features/admin/application/use_cases/get_category_localized_data.dart'
    as _i66;
import 'package:jews_harp/features/admin/application/use_cases/get_hidden_categories.dart'
    as _i68;
import 'package:jews_harp/features/admin/application/use_cases/get_technique_localized_data.dart'
    as _i69;
import 'package:jews_harp/features/admin/application/use_cases/get_techniques_by_category.dart'
    as _i70;
import 'package:jews_harp/features/admin/application/use_cases/get_visible_categories.dart'
    as _i71;
import 'package:jews_harp/features/admin/application/use_cases/pick_image.dart'
    as _i41;
import 'package:jews_harp/features/admin/application/use_cases/pick_video.dart'
    as _i42;
import 'package:jews_harp/features/admin/application/use_cases/update_category.dart'
    as _i51;
import 'package:jews_harp/features/admin/application/use_cases/update_technique.dart'
    as _i52;
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart'
    as _i13;
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart'
    as _i17;
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart'
    as _i6;
import 'package:jews_harp/features/admin/infrastructure/repositories/category_admin_repository.dart'
    as _i14;
import 'package:jews_harp/features/admin/infrastructure/repositories/technique_admin_repository.dart'
    as _i18;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_detail/category_detail_bloc.dart'
    as _i92;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart'
    as _i93;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_localization/category_localization_bloc.dart'
    as _i94;
import 'package:jews_harp/features/admin/presentation/BLoCs/hidden_categories/hidden_categories_bloc.dart'
    as _i73;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_form/technique_form_bloc.dart'
    as _i86;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_list/technique_list_bloc.dart'
    as _i87;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_localization/technique_localization_bloc.dart'
    as _i88;
import 'package:jews_harp/features/admin/presentation/BLoCs/thumbnail_picker/thumbnail_picker_bloc.dart'
    as _i49;
import 'package:jews_harp/features/admin/presentation/BLoCs/video_picker/video_picker_bloc.dart'
    as _i54;
import 'package:jews_harp/features/admin/presentation/BLoCs/visible_categories/visible_categories_bloc.dart'
    as _i90;
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart'
    as _i58;
import 'package:jews_harp/features/auth/application/use_cases/facebook_authentication.dart'
    as _i61;
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart'
    as _i64;
import 'package:jews_harp/features/auth/application/use_cases/get_current_user.dart'
    as _i67;
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart'
    as _i72;
import 'package:jews_harp/features/auth/application/use_cases/link_email_provider.dart'
    as _i36;
import 'package:jews_harp/features/auth/application/use_cases/link_facebook_provider.dart'
    as _i37;
import 'package:jews_harp/features/auth/application/use_cases/password_reset.dart'
    as _i38;
import 'package:jews_harp/features/auth/application/use_cases/reload_user.dart'
    as _i43;
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart'
    as _i44;
import 'package:jews_harp/features/auth/application/use_cases/set_locale.dart'
    as _i45;
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart'
    as _i46;
import 'package:jews_harp/features/auth/application/use_cases/sign_up.dart'
    as _i47;
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart'
    as _i19;
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart'
    as _i31;
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart'
    as _i7;
import 'package:jews_harp/features/auth/infrastructure/external_services/firebase_auth.dart'
    as _i9;
import 'package:jews_harp/features/auth/infrastructure/facades/user_facade.dart'
    as _i20;
import 'package:jews_harp/features/auth/infrastructure/repositories/user_repository.dart'
    as _i32;
import 'package:jews_harp/features/auth/presentation/BLoCs/auth_state/auth_bloc.dart'
    as _i55;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_form/email_form_bloc.dart'
    as _i59;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart'
    as _i60;
import 'package:jews_harp/features/auth/presentation/BLoCs/link_providers/link_providers_bloc.dart'
    as _i78;
import 'package:jews_harp/features/auth/presentation/BLoCs/password_reset/password_reset_bloc.dart'
    as _i39;
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart'
    as _i83;
import 'package:jews_harp/features/auth/presentation/BLoCs/splash_screen/splash_screen_bloc.dart'
    as _i84;
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart'
    as _i89;
import 'package:jews_harp/features/user_section/application/delete_downloaded_technique.dart'
    as _i95;
import 'package:jews_harp/features/user_section/application/download_technique.dart'
    as _i96;
import 'package:jews_harp/features/user_section/application/get_categories.dart'
    as _i65;
import 'package:jews_harp/features/user_section/application/get_downloaded_techniques.dart'
    as _i97;
import 'package:jews_harp/features/user_section/application/get_most_recent_techniques.dart'
    as _i98;
import 'package:jews_harp/features/user_section/application/get_technique_by_Id.dart'
    as _i99;
import 'package:jews_harp/features/user_section/application/get_techniques.dart'
    as _i100;
import 'package:jews_harp/features/user_section/application/get_techniques_by_category.dart'
    as _i101;
import 'package:jews_harp/features/user_section/application/mark_technique_as_favorite.dart'
    as _i79;
import 'package:jews_harp/features/user_section/application/purchase_technique.dart'
    as _i80;
import 'package:jews_harp/features/user_section/application/remove_technique_from_favorites.dart'
    as _i82;
import 'package:jews_harp/features/user_section/domain/facade_interfaces/user_section_facade.dart'
    as _i76;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/category_repository.dart'
    as _i15;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart'
    as _i74;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/category_local_data_source.dart'
    as _i3;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart'
    as _i11;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/technique_local_data_source.dart'
    as _i48;
import 'package:jews_harp/features/user_section/infrastructure/external_services/payment_service.dart'
    as _i40;
import 'package:jews_harp/features/user_section/infrastructure/facades/user_section_facade.dart'
    as _i77;
import 'package:jews_harp/features/user_section/infrastructure/repositories/category_repository.dart'
    as _i16;
import 'package:jews_harp/features/user_section/infrastructure/repositories/technique_repository.dart'
    as _i75;
import 'package:jews_harp/features/user_section/presentation/BLoCs/categories/categories_bloc.dart'
    as _i91;
import 'package:jews_harp/features/user_section/presentation/BLoCs/most_recent_techniques/most_recent_techniques_bloc.dart'
    as _i102;
import 'package:jews_harp/features/user_section/presentation/BLoCs/purchase_technique/purchase_technique_bloc.dart'
    as _i81;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique/technique_bloc.dart'
    as _i103;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_detail/technique_detail_bloc.dart'
    as _i85;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_local_storage/technique_local_storage_bloc.dart'
    as _i104;
import 'package:jews_harp/features/user_section/presentation/BLoCs/user_section_navigation/user_section_navigation_bloc.dart'
    as _i53;

import '../unit/auth/facades/user_auth_facade_test.dart' as _i10;
import '../unit/auth/repositories/user_repository_test.dart' as _i8;
import '../unit/auth/use_cases/email_authentication_test.dart' as _i26;
import '../unit/auth/use_cases/facebook_authentication_test.dart' as _i25;
import '../unit/auth/use_cases/get_authentication_providers_test.dart' as _i35;
import '../unit/auth/use_cases/get_current_user_test.dart' as _i34;
import '../unit/auth/use_cases/google_authentication_test.dart' as _i24;
import '../unit/auth/use_cases/link_email_provider_test.dart' as _i29;
import '../unit/auth/use_cases/link_facebook_provider_test.dart' as _i30;
import '../unit/auth/use_cases/password_reset_test.dart' as _i27;
import '../unit/auth/use_cases/reload_user_test.dart' as _i33;
import '../unit/auth/use_cases/send_email_verification_test.dart' as _i22;
import '../unit/auth/use_cases/set_locale_test.dart' as _i23;
import '../unit/auth/use_cases/sign_out_test.dart' as _i28;
import '../unit/auth/use_cases/sign_up_test.dart' as _i21;

const String _prod = 'prod';
const String _dev = 'dev';
const String _user_auth_repository_test_env = 'user_auth_repository_test_env';
const String _user_auth_facade_test_env = 'user_auth_facade_test_env';
const String _sign_up_test_env = 'sign_up_test_env';
const String _send_email_verification_test_env =
    'send_email_verification_test_env';
const String _set_locale_test_env = 'set_locale_test_env';
const String _google_authentication_test_env = 'google_authentication_test_env';
const String _facebook_authentication_test_env =
    'facebook_authentication_test_env';
const String _email_authentication_test_env = 'email_authentication_test_env';
const String _password_reset_test_env = 'password_reset_test_env';
const String _sign_out_test_env = 'sign_out_test_env';
const String _link_email_provider_test_env = 'link_email_provider_test_env';
const String _link_facebook_provider_test_env =
    'link_facebook_provider_test_env';
const String _reload_user_test_env = 'reload_user_test_env';
const String _get_current_user_test_env = 'get_current_user_test_env';
const String _get_authentication_providers_test_env =
    'get_authentication_providers_test_env';
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
      registerFor: {_user_auth_repository_test_env});
  gh.lazySingleton<_i7.FirebaseAuthDataSource>(
      () => _i7.FirebaseAuthDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i9.FirebaseAuthService>(
      () => _i10.FirebaseAuthServiceMock(),
      registerFor: {_user_auth_facade_test_env});
  gh.lazySingleton<_i9.FirebaseAuthService>(() => _i9.FirebaseAuthService(),
      registerFor: {_prod});
  gh.lazySingleton<_i11.FirebaseUserSectionDataSource>(
      () => _i11.FirebaseUserSectionDataSource(),
      registerFor: {_prod});
  gh.factory<_i12.HideFieldInputBloc>(() => _i12.HideFieldInputBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i13.ICategoryAdminRepository>(
      () => _i14.CategoryAdminRepository(get<_i6.FirebaseAdminDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i15.ICategoryRepository>(
      () => _i16.CategoryRepository(get<_i11.FirebaseUserSectionDataSource>(),
          get<_i3.CategoryLocalDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i17.ITechniqueAdminRepository>(
      () => _i18.TechniqueAdminRepository(get<_i6.FirebaseAdminDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i19.IUserAuthFacade>(
      () => _i20.UserAuthFacade(get<_i9.FirebaseAuthService>()),
      registerFor: {_prod, _user_auth_facade_test_env});
  gh.lazySingleton<_i19.IUserAuthFacade>(() => _i21.UserAuthFacade(),
      registerFor: {_sign_up_test_env});
  gh.lazySingleton<_i19.IUserAuthFacade>(() => _i22.UserAuthFacade(),
      registerFor: {_send_email_verification_test_env});
  gh.lazySingleton<_i19.IUserAuthFacade>(() => _i23.UserAuthFacade(),
      registerFor: {_set_locale_test_env});
  gh.lazySingleton<_i19.IUserAuthFacade>(() => _i24.UserAuthFacadeMock(),
      registerFor: {_google_authentication_test_env});
  gh.lazySingleton<_i19.IUserAuthFacade>(() => _i25.UserAuthFacade(),
      registerFor: {_facebook_authentication_test_env});
  gh.lazySingleton<_i19.IUserAuthFacade>(() => _i26.UserAuthFacade(),
      registerFor: {_email_authentication_test_env});
  gh.lazySingleton<_i19.IUserAuthFacade>(() => _i27.UserAuthFacade(),
      registerFor: {_password_reset_test_env});
  gh.lazySingleton<_i19.IUserAuthFacade>(() => _i28.UserAuthFacade(),
      registerFor: {_sign_out_test_env});
  gh.lazySingleton<_i19.IUserAuthFacade>(() => _i29.UserAuthFacade(),
      registerFor: {_link_email_provider_test_env});
  gh.lazySingleton<_i19.IUserAuthFacade>(() => _i30.UserAuthFacade(),
      registerFor: {_link_facebook_provider_test_env});
  gh.lazySingleton<_i31.IUserAuthRepository>(
      () => _i32.UserAuthRepository(get<_i7.FirebaseAuthDataSource>()),
      registerFor: {_prod, _user_auth_repository_test_env});
  gh.lazySingleton<_i31.IUserAuthRepository>(
      () => _i33.UserAuthRepositoryMock(),
      registerFor: {_reload_user_test_env});
  gh.lazySingleton<_i31.IUserAuthRepository>(
      () => _i34.UserAuthRepositoryMock(),
      registerFor: {_get_current_user_test_env});
  gh.lazySingleton<_i31.IUserAuthRepository>(
      () => _i35.UserAuthRepositoryMock(),
      registerFor: {_get_authentication_providers_test_env});
  gh.lazySingleton<_i36.LinkEmailProvider>(
      () => _i36.LinkEmailProvider(get<_i19.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _link_email_provider_test_env});
  gh.lazySingleton<_i37.LinkFacebookProvider>(
      () => _i37.LinkFacebookProvider(get<_i19.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _link_facebook_provider_test_env});
  gh.lazySingleton<_i34.OfflineGetCurrentUser>(
      () => _i34.OfflineGetCurrentUser(get<_i31.IUserAuthRepository>()),
      registerFor: {_get_current_user_test_env});
  gh.lazySingleton<_i34.OnlineGetCurrentUser>(
      () => _i34.OnlineGetCurrentUser(get<_i31.IUserAuthRepository>()),
      registerFor: {_get_current_user_test_env});
  gh.lazySingleton<_i38.PasswordReset>(
      () => _i38.PasswordReset(get<_i19.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _password_reset_test_env});
  gh.factory<_i39.PasswordResetBloc>(
      () => _i39.PasswordResetBloc(get<_i38.PasswordReset>(),
          get<_i4.ConnectivityBloc>(), get<_i5.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i40.PaymentService>(() => _i40.PaymentService(),
      registerFor: {_prod});
  gh.lazySingleton<_i41.PickImage>(() => _i41.PickImage(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i42.PickVideo>(() => _i42.PickVideo(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i43.ReloadUser>(
      () => _i43.ReloadUser(get<_i31.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _reload_user_test_env});
  gh.lazySingleton<_i44.SendEmailVerification>(
      () => _i44.SendEmailVerification(get<_i19.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _send_email_verification_test_env});
  gh.lazySingleton<_i45.SetLocale>(
      () => _i45.SetLocale(get<_i19.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _set_locale_test_env});
  gh.lazySingleton<_i46.SignOut>(
      () => _i46.SignOut(get<_i19.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _sign_out_test_env});
  gh.lazySingleton<_i47.SignUp>(() => _i47.SignUp(get<_i19.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _sign_up_test_env});
  gh.lazySingleton<_i48.TechniqueLocalDataSource>(
      () => _i48.TechniqueLocalDataSource(),
      registerFor: {_prod});
  gh.factory<_i49.ThumbnailPickerBloc>(
      () => _i49.ThumbnailPickerBloc(get<_i41.PickImage>()),
      registerFor: {_prod, _dev});
  gh.factory<_i50.ToggleSwitchBloc>(() => _i50.ToggleSwitchBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i51.UpdateCategory>(
      () => _i51.UpdateCategory(get<_i13.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i52.UpdateTechnique>(
      () => _i52.UpdateTechnique(get<_i17.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i53.UserSectionNavigationBloc>(
      () => _i53.UserSectionNavigationBloc(),
      registerFor: {_prod, _dev});
  gh.factory<_i54.VideoPickerBloc>(
      () => _i54.VideoPickerBloc(get<_i42.PickVideo>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i55.AuthBloc>(
      () => _i55.AuthBloc(get<_i43.ReloadUser>(), get<_i46.SignOut>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i56.CreateCategory>(
      () => _i56.CreateCategory(get<_i13.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i57.CreateTechnique>(
      () => _i57.CreateTechnique(get<_i17.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i58.EmailAuthentication>(
      () => _i58.EmailAuthentication(get<_i19.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _email_authentication_test_env});
  gh.factory<_i59.EmailFormBloc>(() => _i59.EmailFormBloc(
      get<_i58.EmailAuthentication>(),
      get<_i4.ConnectivityBloc>(),
      get<_i5.ErrorBloc>(),
      get<_i55.AuthBloc>()));
  gh.factory<_i60.EmailVerificationBloc>(
      () => _i60.EmailVerificationBloc(
          get<_i44.SendEmailVerification>(),
          get<_i4.ConnectivityBloc>(),
          get<_i43.ReloadUser>(),
          get<_i5.ErrorBloc>(),
          get<_i55.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i23.EnglishCzechSupportSetLocale>(
      () => _i23.EnglishCzechSupportSetLocale(get<_i19.IUserAuthFacade>()),
      registerFor: {_set_locale_test_env});
  gh.lazySingleton<_i61.FacebookAuthentication>(
      () => _i61.FacebookAuthentication(get<_i19.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _facebook_authentication_test_env});
  gh.lazySingleton<_i62.GetAllCategories>(
      () => _i62.GetAllCategories(get<_i13.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i63.GetAllTechniques>(
      () => _i63.GetAllTechniques(get<_i17.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i64.GetAuthProviders>(
      () => _i64.GetAuthProviders(get<_i31.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _get_authentication_providers_test_env});
  gh.lazySingleton<_i65.GetCategories>(
      () => _i65.GetCategories(get<_i15.ICategoryRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i66.GetCategoryLocalizedData>(
      () => _i66.GetCategoryLocalizedData(get<_i13.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i67.GetCurrentUser>(
      () => _i67.GetCurrentUser(get<_i31.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _get_current_user_test_env});
  gh.lazySingleton<_i68.GetHiddenCategories>(
      () => _i68.GetHiddenCategories(get<_i13.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i69.GetTechniqueLocalizedData>(
      () =>
          _i69.GetTechniqueLocalizedData(get<_i17.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i70.GetTechniquesByCategory>(
      () => _i70.GetTechniquesByCategory(get<_i17.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i71.GetVisibleCategories>(
      () => _i71.GetVisibleCategories(get<_i13.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i72.GoogleAuthentication>(
      () => _i72.GoogleAuthentication(get<_i19.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _google_authentication_test_env});
  gh.factory<_i73.HiddenCategoriesBloc>(
      () => _i73.HiddenCategoriesBloc(get<_i68.GetHiddenCategories>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i74.ITechniqueRepository>(
      () => _i75.TechniqueRepository(get<_i11.FirebaseUserSectionDataSource>(),
          get<_i48.TechniqueLocalDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i76.IUserSectionFacade>(
      () => _i77.UserSectionFacade(get<_i40.PaymentService>(),
          get<_i11.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.factoryParam<_i78.LinkProvidersBloc, _i78.LinkProvidersState?, dynamic>(
      (initialState, _) => _i78.LinkProvidersBloc(
          initialState,
          get<_i61.FacebookAuthentication>(),
          get<_i72.GoogleAuthentication>(),
          get<_i58.EmailAuthentication>(),
          get<_i37.LinkFacebookProvider>(),
          get<_i36.LinkEmailProvider>(),
          get<_i46.SignOut>(),
          get<_i5.ErrorBloc>(),
          get<_i55.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i79.MarkTechniqueAsFavorite>(
      () => _i79.MarkTechniqueAsFavorite(get<_i76.IUserSectionFacade>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i80.PurchaseTechnique>(
      () => _i80.PurchaseTechnique(get<_i76.IUserSectionFacade>()),
      registerFor: {_prod, _dev});
  gh.factory<_i81.PurchaseTechniqueBloc>(
      () => _i81.PurchaseTechniqueBloc(
          get<_i80.PurchaseTechnique>(), get<_i5.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i82.RemoveTechniqueFromFavorites>(
      () => _i82.RemoveTechniqueFromFavorites(get<_i76.IUserSectionFacade>()),
      registerFor: {_prod, _dev});
  gh.factory<_i83.SignUpBloc>(
      () => _i83.SignUpBloc(
          get<_i47.SignUp>(),
          get<_i64.GetAuthProviders>(),
          get<_i4.ConnectivityBloc>(),
          get<_i5.ErrorBloc>(),
          get<_i55.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i84.SplashScreenBloc>(
      () => _i84.SplashScreenBloc(get<_i67.GetCurrentUser>(),
          get<_i45.SetLocale>(), get<_i55.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i85.TechniqueDetailBloc>(
      () => _i85.TechniqueDetailBloc(get<_i79.MarkTechniqueAsFavorite>(),
          get<_i82.RemoveTechniqueFromFavorites>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i86.TechniqueFormBloc, _i86.TechniqueFormState?, dynamic>(
      (initialState, _) => _i86.TechniqueFormBloc(
          initialState,
          get<_i62.GetAllCategories>(),
          get<_i57.CreateTechnique>(),
          get<_i52.UpdateTechnique>(),
          get<_i5.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i87.TechniqueListBloc>(
      () => _i87.TechniqueListBloc(get<_i63.GetAllTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i88.TechniqueLocalizationBloc>(
      () =>
          _i88.TechniqueLocalizationBloc(get<_i69.GetTechniqueLocalizedData>()),
      registerFor: {_prod, _dev});
  gh.factory<_i89.ThirdPartyAuthBloc>(
      () => _i89.ThirdPartyAuthBloc(
          get<_i61.FacebookAuthentication>(),
          get<_i72.GoogleAuthentication>(),
          get<_i64.GetAuthProviders>(),
          get<_i55.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i90.VisibleCategoriesBloc>(
      () => _i90.VisibleCategoriesBloc(get<_i71.GetVisibleCategories>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i91.CategoriesBloc>(
      () => _i91.CategoriesBloc(get<_i65.GetCategories>()),
      registerFor: {_prod, _dev});
  gh.factory<_i92.CategoryDetailBloc>(
      () => _i92.CategoryDetailBloc(get<_i70.GetTechniquesByCategory>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i93.CategoryFormBloc, _i93.CategoryFormState?, dynamic>(
      (initialState, _) => _i93.CategoryFormBloc(
          initialState, get<_i56.CreateCategory>(), get<_i51.UpdateCategory>()),
      registerFor: {_prod, _dev});
  gh.factory<_i94.CategoryLocalizationBloc>(
      () => _i94.CategoryLocalizationBloc(get<_i66.GetCategoryLocalizedData>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i95.DeleteDownloadedTechnique>(
      () => _i95.DeleteDownloadedTechnique(get<_i74.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i96.DownloadTechnique>(
      () => _i96.DownloadTechnique(get<_i74.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i97.GetDownloadedTechniques>(
      () => _i97.GetDownloadedTechniques(get<_i74.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i98.GetMostRecentTechniques>(
      () => _i98.GetMostRecentTechniques(get<_i74.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i99.GetTechniqueById>(
      () => _i99.GetTechniqueById(get<_i74.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i100.GetTechniques>(
      () => _i100.GetTechniques(get<_i74.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i101.GetTechniquesByCategory>(
      () => _i101.GetTechniquesByCategory(get<_i74.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i102.MostRecentTechniquesBloc>(
      () => _i102.MostRecentTechniquesBloc(get<_i98.GetMostRecentTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i103.TechniqueBloc>(
      () => _i103.TechniqueBloc(get<_i99.GetTechniqueById>()),
      registerFor: {_prod, _dev});
  gh.factory<_i104.TechniqueLocalStorageBloc>(
      () => _i104.TechniqueLocalStorageBloc(
          get<_i96.DownloadTechnique>(),
          get<_i97.GetDownloadedTechniques>(),
          get<_i95.DeleteDownloadedTechnique>()),
      registerFor: {_prod, _dev});
  return get;
}
