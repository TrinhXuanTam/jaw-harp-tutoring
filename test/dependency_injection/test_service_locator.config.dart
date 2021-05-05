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
    as _i14;
import 'package:jews_harp/core/BLoCs/toggle_switch/toggle_switch_bloc.dart'
    as _i63;
import 'package:jews_harp/features/admin/application/use_cases/create_category.dart'
    as _i69;
import 'package:jews_harp/features/admin/application/use_cases/create_technique.dart'
    as _i70;
import 'package:jews_harp/features/admin/application/use_cases/get_all_categories.dart'
    as _i75;
import 'package:jews_harp/features/admin/application/use_cases/get_all_techniques.dart'
    as _i76;
import 'package:jews_harp/features/admin/application/use_cases/get_category_localized_data.dart'
    as _i79;
import 'package:jews_harp/features/admin/application/use_cases/get_hidden_categories.dart'
    as _i81;
import 'package:jews_harp/features/admin/application/use_cases/get_technique_localized_data.dart'
    as _i82;
import 'package:jews_harp/features/admin/application/use_cases/get_techniques_by_category.dart'
    as _i83;
import 'package:jews_harp/features/admin/application/use_cases/get_visible_categories.dart'
    as _i84;
import 'package:jews_harp/features/admin/application/use_cases/pick_image.dart'
    as _i54;
import 'package:jews_harp/features/admin/application/use_cases/pick_video.dart'
    as _i55;
import 'package:jews_harp/features/admin/application/use_cases/update_category.dart'
    as _i64;
import 'package:jews_harp/features/admin/application/use_cases/update_technique.dart'
    as _i65;
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart'
    as _i15;
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart'
    as _i25;
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart'
    as _i6;
import 'package:jews_harp/features/admin/infrastructure/repositories/category_admin_repository.dart'
    as _i22;
import 'package:jews_harp/features/admin/infrastructure/repositories/technique_admin_repository.dart'
    as _i31;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_detail/category_detail_bloc.dart'
    as _i105;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart'
    as _i106;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_localization/category_localization_bloc.dart'
    as _i107;
import 'package:jews_harp/features/admin/presentation/BLoCs/hidden_categories/hidden_categories_bloc.dart'
    as _i86;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_form/technique_form_bloc.dart'
    as _i99;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_list/technique_list_bloc.dart'
    as _i100;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_localization/technique_localization_bloc.dart'
    as _i101;
import 'package:jews_harp/features/admin/presentation/BLoCs/thumbnail_picker/thumbnail_picker_bloc.dart'
    as _i62;
import 'package:jews_harp/features/admin/presentation/BLoCs/video_picker/video_picker_bloc.dart'
    as _i67;
import 'package:jews_harp/features/admin/presentation/BLoCs/visible_categories/visible_categories_bloc.dart'
    as _i103;
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart'
    as _i71;
import 'package:jews_harp/features/auth/application/use_cases/facebook_authentication.dart'
    as _i74;
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart'
    as _i77;
import 'package:jews_harp/features/auth/application/use_cases/get_current_user.dart'
    as _i80;
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart'
    as _i85;
import 'package:jews_harp/features/auth/application/use_cases/link_email_provider.dart'
    as _i49;
import 'package:jews_harp/features/auth/application/use_cases/link_facebook_provider.dart'
    as _i50;
import 'package:jews_harp/features/auth/application/use_cases/password_reset.dart'
    as _i51;
import 'package:jews_harp/features/auth/application/use_cases/reload_user.dart'
    as _i56;
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart'
    as _i57;
import 'package:jews_harp/features/auth/application/use_cases/set_locale.dart'
    as _i58;
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart'
    as _i59;
import 'package:jews_harp/features/auth/application/use_cases/sign_up.dart'
    as _i60;
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart'
    as _i32;
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart'
    as _i44;
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart'
    as _i9;
import 'package:jews_harp/features/auth/infrastructure/external_services/firebase_auth.dart'
    as _i11;
import 'package:jews_harp/features/auth/infrastructure/facades/user_facade.dart'
    as _i37;
import 'package:jews_harp/features/auth/infrastructure/repositories/user_repository.dart'
    as _i46;
import 'package:jews_harp/features/auth/presentation/BLoCs/auth_state/auth_bloc.dart'
    as _i68;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_form/email_form_bloc.dart'
    as _i72;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart'
    as _i73;
import 'package:jews_harp/features/auth/presentation/BLoCs/link_providers/link_providers_bloc.dart'
    as _i91;
import 'package:jews_harp/features/auth/presentation/BLoCs/password_reset/password_reset_bloc.dart'
    as _i52;
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart'
    as _i96;
import 'package:jews_harp/features/auth/presentation/BLoCs/splash_screen/splash_screen_bloc.dart'
    as _i97;
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart'
    as _i102;
import 'package:jews_harp/features/user_section/application/delete_downloaded_technique.dart'
    as _i108;
import 'package:jews_harp/features/user_section/application/download_technique.dart'
    as _i109;
import 'package:jews_harp/features/user_section/application/get_categories.dart'
    as _i78;
import 'package:jews_harp/features/user_section/application/get_downloaded_techniques.dart'
    as _i110;
import 'package:jews_harp/features/user_section/application/get_most_recent_techniques.dart'
    as _i111;
import 'package:jews_harp/features/user_section/application/get_technique_by_Id.dart'
    as _i112;
import 'package:jews_harp/features/user_section/application/get_techniques.dart'
    as _i113;
import 'package:jews_harp/features/user_section/application/get_techniques_by_category.dart'
    as _i114;
import 'package:jews_harp/features/user_section/application/mark_technique_as_favorite.dart'
    as _i92;
import 'package:jews_harp/features/user_section/application/purchase_technique.dart'
    as _i93;
import 'package:jews_harp/features/user_section/application/remove_technique_from_favorites.dart'
    as _i95;
import 'package:jews_harp/features/user_section/domain/facade_interfaces/user_section_facade.dart'
    as _i89;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/category_repository.dart'
    as _i23;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart'
    as _i87;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/category_local_data_source.dart'
    as _i3;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart'
    as _i13;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/technique_local_data_source.dart'
    as _i61;
import 'package:jews_harp/features/user_section/infrastructure/external_services/payment_service.dart'
    as _i53;
import 'package:jews_harp/features/user_section/infrastructure/facades/user_section_facade.dart'
    as _i90;
import 'package:jews_harp/features/user_section/infrastructure/repositories/category_repository.dart'
    as _i24;
import 'package:jews_harp/features/user_section/infrastructure/repositories/technique_repository.dart'
    as _i88;
import 'package:jews_harp/features/user_section/presentation/BLoCs/categories/categories_bloc.dart'
    as _i104;
import 'package:jews_harp/features/user_section/presentation/BLoCs/most_recent_techniques/most_recent_techniques_bloc.dart'
    as _i115;
import 'package:jews_harp/features/user_section/presentation/BLoCs/purchase_technique/purchase_technique_bloc.dart'
    as _i94;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique/technique_bloc.dart'
    as _i116;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_detail/technique_detail_bloc.dart'
    as _i98;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_local_storage/technique_local_storage_bloc.dart'
    as _i117;
import 'package:jews_harp/features/user_section/presentation/BLoCs/user_section_navigation/user_section_navigation_bloc.dart'
    as _i66;

import '../unit/admin/repositories/category_admin_repository_test.dart' as _i8;
import '../unit/admin/repositories/technique_admin_repository_test.dart' as _i7;
import '../unit/admin/use_cases/create_category_test.dart' as _i21;
import '../unit/admin/use_cases/create_technique_test.dart' as _i30;
import '../unit/admin/use_cases/get_all_categories_test.dart' as _i20;
import '../unit/admin/use_cases/get_all_techniques_test.dart' as _i29;
import '../unit/admin/use_cases/get_category_localized_data_test.dart' as _i19;
import '../unit/admin/use_cases/get_hidden_categories_test.dart' as _i16;
import '../unit/admin/use_cases/get_technique_localized_data_test.dart' as _i28;
import '../unit/admin/use_cases/get_techniques_by_category_test.dart' as _i26;
import '../unit/admin/use_cases/get_visible_categories_test.dart' as _i18;
import '../unit/admin/use_cases/update_category_test.dart' as _i17;
import '../unit/admin/use_cases/update_technique_test.dart' as _i27;
import '../unit/auth/facades/user_auth_facade_test.dart' as _i12;
import '../unit/auth/repositories/user_repository_test.dart' as _i10;
import '../unit/auth/use_cases/email_authentication_test.dart' as _i42;
import '../unit/auth/use_cases/facebook_authentication_test.dart' as _i33;
import '../unit/auth/use_cases/get_authentication_providers_test.dart' as _i47;
import '../unit/auth/use_cases/get_current_user_test.dart' as _i48;
import '../unit/auth/use_cases/google_authentication_test.dart' as _i35;
import '../unit/auth/use_cases/link_email_provider_test.dart' as _i36;
import '../unit/auth/use_cases/link_facebook_provider_test.dart' as _i38;
import '../unit/auth/use_cases/password_reset_test.dart' as _i39;
import '../unit/auth/use_cases/reload_user_test.dart' as _i45;
import '../unit/auth/use_cases/send_email_verification_test.dart' as _i43;
import '../unit/auth/use_cases/set_locale_test.dart' as _i34;
import '../unit/auth/use_cases/sign_out_test.dart' as _i41;
import '../unit/auth/use_cases/sign_up_test.dart' as _i40;

const String _prod = 'prod';
const String _dev = 'dev';
const String _technique_admin_repository_test_env =
    'technique_admin_repository_test_env';
const String _category_admin_repository_test_env =
    'category_admin_repository_test_env';
const String _user_auth_repository_test_env = 'user_auth_repository_test_env';
const String _user_auth_facade_test_env = 'user_auth_facade_test_env';
const String _get_hidden_categories_test_env = 'get_hidden_categories_test_env';
const String _update_category_test_env = 'update_category_test_env';
const String _get_visible_categories_test_env =
    'get_visible_categories_test_env';
const String _get_category_localized_data_test_env =
    'get_category_localized_data_test_env';
const String _get_all_categories_test_env = 'get_all_categories_test_env';
const String _create_category_test_env = 'create_category_test_env';
const String _get_techniques_by_category_test_env =
    'get_techniques_by_category_test_env';
const String _update_technique_test_env = 'update_technique_test_env';
const String _get_technique_localized_data_test_env =
    'get_technique_localized_data_test_env';
const String _get_all_techniques_test_env = 'get_all_techniques_test_env';
const String _create_technique_test_env = 'create_technique_test_env';
const String _facebook_authentication_test_env =
    'facebook_authentication_test_env';
const String _set_locale_test_env = 'set_locale_test_env';
const String _google_authentication_test_env = 'google_authentication_test_env';
const String _link_email_provider_test_env = 'link_email_provider_test_env';
const String _link_facebook_provider_test_env =
    'link_facebook_provider_test_env';
const String _password_reset_test_env = 'password_reset_test_env';
const String _sign_up_test_env = 'sign_up_test_env';
const String _sign_out_test_env = 'sign_out_test_env';
const String _email_authentication_test_env = 'email_authentication_test_env';
const String _send_email_verification_test_env =
    'send_email_verification_test_env';
const String _reload_user_test_env = 'reload_user_test_env';
const String _get_authentication_providers_test_env =
    'get_authentication_providers_test_env';
const String _get_current_user_test_env = 'get_current_user_test_env';
const String _pick_image_test_env = 'pick_image_test_env';
const String _pick_video_test_env = 'pick_video_test_env';
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
  gh.lazySingleton<_i6.FirebaseAdminDataSource>(
      () => _i7.FirebaseAdminDataSourceMock(),
      registerFor: {_technique_admin_repository_test_env});
  gh.lazySingleton<_i6.FirebaseAdminDataSource>(
      () => _i8.FirebaseAdminDataSourceMock(),
      registerFor: {_category_admin_repository_test_env});
  gh.lazySingleton<_i9.FirebaseAuthDataSource>(
      () => _i9.FirebaseAuthDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i9.FirebaseAuthDataSource>(
      () => _i10.FirebaseAuthDataSourceMock(),
      registerFor: {_user_auth_repository_test_env});
  gh.lazySingleton<_i11.FirebaseAuthService>(
      () => _i12.FirebaseAuthServiceMock(),
      registerFor: {_user_auth_facade_test_env});
  gh.lazySingleton<_i11.FirebaseAuthService>(() => _i11.FirebaseAuthService(),
      registerFor: {_prod});
  gh.lazySingleton<_i13.FirebaseUserSectionDataSource>(
      () => _i13.FirebaseUserSectionDataSource(),
      registerFor: {_prod});
  gh.factory<_i14.HideFieldInputBloc>(() => _i14.HideFieldInputBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i15.ICategoryAdminRepository>(
      () => _i16.CategoryAdminRepository(),
      registerFor: {_get_hidden_categories_test_env});
  gh.lazySingleton<_i15.ICategoryAdminRepository>(
      () => _i17.CategoryAdminRepository(),
      registerFor: {_update_category_test_env});
  gh.lazySingleton<_i15.ICategoryAdminRepository>(
      () => _i18.CategoryAdminRepository(),
      registerFor: {_get_visible_categories_test_env});
  gh.lazySingleton<_i15.ICategoryAdminRepository>(
      () => _i19.CategoryAdminRepository(),
      registerFor: {_get_category_localized_data_test_env});
  gh.lazySingleton<_i15.ICategoryAdminRepository>(
      () => _i20.CategoryAdminRepository(),
      registerFor: {_get_all_categories_test_env});
  gh.lazySingleton<_i15.ICategoryAdminRepository>(
      () => _i21.CategoryAdminRepository(),
      registerFor: {_create_category_test_env});
  gh.lazySingleton<_i15.ICategoryAdminRepository>(
      () => _i22.CategoryAdminRepository(get<_i6.FirebaseAdminDataSource>()),
      registerFor: {_prod, _category_admin_repository_test_env});
  gh.lazySingleton<_i23.ICategoryRepository>(
      () => _i24.CategoryRepository(get<_i13.FirebaseUserSectionDataSource>(),
          get<_i3.CategoryLocalDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i25.ITechniqueAdminRepository>(
      () => _i26.TechniqueAdminRepository(),
      registerFor: {_get_techniques_by_category_test_env});
  gh.lazySingleton<_i25.ITechniqueAdminRepository>(
      () => _i27.TechniqueAdminRepository(),
      registerFor: {_update_technique_test_env});
  gh.lazySingleton<_i25.ITechniqueAdminRepository>(
      () => _i28.TechniqueAdminRepository(),
      registerFor: {_get_technique_localized_data_test_env});
  gh.lazySingleton<_i25.ITechniqueAdminRepository>(
      () => _i29.TechniqueAdminRepository(),
      registerFor: {_get_all_techniques_test_env});
  gh.lazySingleton<_i25.ITechniqueAdminRepository>(
      () => _i30.TechniqueAdminRepository(),
      registerFor: {_create_technique_test_env});
  gh.lazySingleton<_i25.ITechniqueAdminRepository>(
      () => _i31.TechniqueAdminRepository(get<_i6.FirebaseAdminDataSource>()),
      registerFor: {_prod, _technique_admin_repository_test_env});
  gh.lazySingleton<_i32.IUserAuthFacade>(() => _i33.UserAuthFacade(),
      registerFor: {_facebook_authentication_test_env});
  gh.lazySingleton<_i32.IUserAuthFacade>(() => _i34.UserAuthFacade(),
      registerFor: {_set_locale_test_env});
  gh.lazySingleton<_i32.IUserAuthFacade>(() => _i35.UserAuthFacadeMock(),
      registerFor: {_google_authentication_test_env});
  gh.lazySingleton<_i32.IUserAuthFacade>(() => _i36.UserAuthFacade(),
      registerFor: {_link_email_provider_test_env});
  gh.lazySingleton<_i32.IUserAuthFacade>(
      () => _i37.UserAuthFacade(get<_i11.FirebaseAuthService>()),
      registerFor: {_prod, _user_auth_facade_test_env});
  gh.lazySingleton<_i32.IUserAuthFacade>(() => _i38.UserAuthFacade(),
      registerFor: {_link_facebook_provider_test_env});
  gh.lazySingleton<_i32.IUserAuthFacade>(() => _i39.UserAuthFacade(),
      registerFor: {_password_reset_test_env});
  gh.lazySingleton<_i32.IUserAuthFacade>(() => _i40.UserAuthFacade(),
      registerFor: {_sign_up_test_env});
  gh.lazySingleton<_i32.IUserAuthFacade>(() => _i41.UserAuthFacade(),
      registerFor: {_sign_out_test_env});
  gh.lazySingleton<_i32.IUserAuthFacade>(() => _i42.UserAuthFacade(),
      registerFor: {_email_authentication_test_env});
  gh.lazySingleton<_i32.IUserAuthFacade>(() => _i43.UserAuthFacade(),
      registerFor: {_send_email_verification_test_env});
  gh.lazySingleton<_i44.IUserAuthRepository>(
      () => _i45.UserAuthRepositoryMock(),
      registerFor: {_reload_user_test_env});
  gh.lazySingleton<_i44.IUserAuthRepository>(
      () => _i46.UserAuthRepository(get<_i9.FirebaseAuthDataSource>()),
      registerFor: {_prod, _user_auth_repository_test_env});
  gh.lazySingleton<_i44.IUserAuthRepository>(
      () => _i47.UserAuthRepositoryMock(),
      registerFor: {_get_authentication_providers_test_env});
  gh.lazySingleton<_i44.IUserAuthRepository>(
      () => _i48.UserAuthRepositoryMock(),
      registerFor: {_get_current_user_test_env});
  gh.lazySingleton<_i49.LinkEmailProvider>(
      () => _i49.LinkEmailProvider(get<_i32.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _link_email_provider_test_env});
  gh.lazySingleton<_i50.LinkFacebookProvider>(
      () => _i50.LinkFacebookProvider(get<_i32.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _link_facebook_provider_test_env});
  gh.lazySingleton<_i48.OfflineGetCurrentUser>(
      () => _i48.OfflineGetCurrentUser(get<_i44.IUserAuthRepository>()),
      registerFor: {_get_current_user_test_env});
  gh.lazySingleton<_i48.OnlineGetCurrentUser>(
      () => _i48.OnlineGetCurrentUser(get<_i44.IUserAuthRepository>()),
      registerFor: {_get_current_user_test_env});
  gh.lazySingleton<_i51.PasswordReset>(
      () => _i51.PasswordReset(get<_i32.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _password_reset_test_env});
  gh.factory<_i52.PasswordResetBloc>(
      () => _i52.PasswordResetBloc(get<_i51.PasswordReset>(),
          get<_i4.ConnectivityBloc>(), get<_i5.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i53.PaymentService>(() => _i53.PaymentService(),
      registerFor: {_prod});
  gh.lazySingleton<_i54.PickImage>(() => _i54.PickImage(),
      registerFor: {_prod, _dev, _pick_image_test_env});
  gh.lazySingleton<_i55.PickVideo>(() => _i55.PickVideo(),
      registerFor: {_prod, _dev, _pick_video_test_env});
  gh.lazySingleton<_i56.ReloadUser>(
      () => _i56.ReloadUser(get<_i44.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _reload_user_test_env});
  gh.lazySingleton<_i57.SendEmailVerification>(
      () => _i57.SendEmailVerification(get<_i32.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _send_email_verification_test_env});
  gh.lazySingleton<_i58.SetLocale>(
      () => _i58.SetLocale(get<_i32.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _set_locale_test_env});
  gh.lazySingleton<_i59.SignOut>(
      () => _i59.SignOut(get<_i32.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _sign_out_test_env});
  gh.lazySingleton<_i60.SignUp>(() => _i60.SignUp(get<_i32.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _sign_up_test_env});
  gh.lazySingleton<_i61.TechniqueLocalDataSource>(
      () => _i61.TechniqueLocalDataSource(),
      registerFor: {_prod});
  gh.factory<_i62.ThumbnailPickerBloc>(
      () => _i62.ThumbnailPickerBloc(get<_i54.PickImage>()),
      registerFor: {_prod, _dev});
  gh.factory<_i63.ToggleSwitchBloc>(() => _i63.ToggleSwitchBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i64.UpdateCategory>(
      () => _i64.UpdateCategory(get<_i15.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev, _update_category_test_env});
  gh.lazySingleton<_i65.UpdateTechnique>(
      () => _i65.UpdateTechnique(get<_i25.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev, _update_technique_test_env});
  gh.factory<_i66.UserSectionNavigationBloc>(
      () => _i66.UserSectionNavigationBloc(),
      registerFor: {_prod, _dev});
  gh.factory<_i67.VideoPickerBloc>(
      () => _i67.VideoPickerBloc(get<_i55.PickVideo>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i68.AuthBloc>(
      () => _i68.AuthBloc(get<_i56.ReloadUser>(), get<_i59.SignOut>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i69.CreateCategory>(
      () => _i69.CreateCategory(get<_i15.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev, _create_category_test_env});
  gh.lazySingleton<_i70.CreateTechnique>(
      () => _i70.CreateTechnique(get<_i25.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev, _create_technique_test_env});
  gh.lazySingleton<_i71.EmailAuthentication>(
      () => _i71.EmailAuthentication(get<_i32.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _email_authentication_test_env});
  gh.factory<_i72.EmailFormBloc>(() => _i72.EmailFormBloc(
      get<_i71.EmailAuthentication>(),
      get<_i4.ConnectivityBloc>(),
      get<_i5.ErrorBloc>(),
      get<_i68.AuthBloc>()));
  gh.factory<_i73.EmailVerificationBloc>(
      () => _i73.EmailVerificationBloc(
          get<_i57.SendEmailVerification>(),
          get<_i4.ConnectivityBloc>(),
          get<_i56.ReloadUser>(),
          get<_i5.ErrorBloc>(),
          get<_i68.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i34.EnglishCzechSupportSetLocale>(
      () => _i34.EnglishCzechSupportSetLocale(get<_i32.IUserAuthFacade>()),
      registerFor: {_set_locale_test_env});
  gh.lazySingleton<_i74.FacebookAuthentication>(
      () => _i74.FacebookAuthentication(get<_i32.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _facebook_authentication_test_env});
  gh.lazySingleton<_i75.GetAllCategories>(
      () => _i75.GetAllCategories(get<_i15.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev, _get_all_categories_test_env});
  gh.lazySingleton<_i76.GetAllTechniques>(
      () => _i76.GetAllTechniques(get<_i25.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev, _get_all_techniques_test_env});
  gh.lazySingleton<_i77.GetAuthProviders>(
      () => _i77.GetAuthProviders(get<_i44.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _get_authentication_providers_test_env});
  gh.lazySingleton<_i78.GetCategories>(
      () => _i78.GetCategories(get<_i23.ICategoryRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i79.GetCategoryLocalizedData>(
      () => _i79.GetCategoryLocalizedData(get<_i15.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev, _get_category_localized_data_test_env});
  gh.lazySingleton<_i80.GetCurrentUser>(
      () => _i80.GetCurrentUser(get<_i44.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _get_current_user_test_env});
  gh.lazySingleton<_i81.GetHiddenCategories>(
      () => _i81.GetHiddenCategories(get<_i15.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev, _get_hidden_categories_test_env});
  gh.lazySingleton<_i82.GetTechniqueLocalizedData>(
      () =>
          _i82.GetTechniqueLocalizedData(get<_i25.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev, _get_technique_localized_data_test_env});
  gh.lazySingleton<_i83.GetTechniquesByCategory>(
      () => _i83.GetTechniquesByCategory(get<_i25.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev, _get_techniques_by_category_test_env});
  gh.lazySingleton<_i84.GetVisibleCategories>(
      () => _i84.GetVisibleCategories(get<_i15.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev, _get_visible_categories_test_env});
  gh.lazySingleton<_i85.GoogleAuthentication>(
      () => _i85.GoogleAuthentication(get<_i32.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _google_authentication_test_env});
  gh.factory<_i86.HiddenCategoriesBloc>(
      () => _i86.HiddenCategoriesBloc(get<_i81.GetHiddenCategories>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i87.ITechniqueRepository>(
      () => _i88.TechniqueRepository(get<_i13.FirebaseUserSectionDataSource>(),
          get<_i61.TechniqueLocalDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i89.IUserSectionFacade>(
      () => _i90.UserSectionFacade(get<_i53.PaymentService>(),
          get<_i13.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.factoryParam<_i91.LinkProvidersBloc, _i91.LinkProvidersState?, dynamic>(
      (initialState, _) => _i91.LinkProvidersBloc(
          initialState,
          get<_i74.FacebookAuthentication>(),
          get<_i85.GoogleAuthentication>(),
          get<_i71.EmailAuthentication>(),
          get<_i50.LinkFacebookProvider>(),
          get<_i49.LinkEmailProvider>(),
          get<_i59.SignOut>(),
          get<_i5.ErrorBloc>(),
          get<_i68.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i92.MarkTechniqueAsFavorite>(
      () => _i92.MarkTechniqueAsFavorite(get<_i89.IUserSectionFacade>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i93.PurchaseTechnique>(
      () => _i93.PurchaseTechnique(get<_i89.IUserSectionFacade>()),
      registerFor: {_prod, _dev});
  gh.factory<_i94.PurchaseTechniqueBloc>(
      () => _i94.PurchaseTechniqueBloc(
          get<_i93.PurchaseTechnique>(), get<_i5.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i95.RemoveTechniqueFromFavorites>(
      () => _i95.RemoveTechniqueFromFavorites(get<_i89.IUserSectionFacade>()),
      registerFor: {_prod, _dev});
  gh.factory<_i96.SignUpBloc>(
      () => _i96.SignUpBloc(
          get<_i60.SignUp>(),
          get<_i77.GetAuthProviders>(),
          get<_i4.ConnectivityBloc>(),
          get<_i5.ErrorBloc>(),
          get<_i68.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i97.SplashScreenBloc>(
      () => _i97.SplashScreenBloc(get<_i80.GetCurrentUser>(),
          get<_i58.SetLocale>(), get<_i68.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i98.TechniqueDetailBloc>(
      () => _i98.TechniqueDetailBloc(get<_i92.MarkTechniqueAsFavorite>(),
          get<_i95.RemoveTechniqueFromFavorites>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i99.TechniqueFormBloc, _i99.TechniqueFormState?, dynamic>(
      (initialState, _) => _i99.TechniqueFormBloc(
          initialState,
          get<_i75.GetAllCategories>(),
          get<_i70.CreateTechnique>(),
          get<_i65.UpdateTechnique>(),
          get<_i5.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i100.TechniqueListBloc>(
      () => _i100.TechniqueListBloc(get<_i76.GetAllTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i101.TechniqueLocalizationBloc>(
      () => _i101.TechniqueLocalizationBloc(
          get<_i82.GetTechniqueLocalizedData>()),
      registerFor: {_prod, _dev});
  gh.factory<_i102.ThirdPartyAuthBloc>(
      () => _i102.ThirdPartyAuthBloc(
          get<_i74.FacebookAuthentication>(),
          get<_i85.GoogleAuthentication>(),
          get<_i77.GetAuthProviders>(),
          get<_i68.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i103.VisibleCategoriesBloc>(
      () => _i103.VisibleCategoriesBloc(get<_i84.GetVisibleCategories>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i104.CategoriesBloc>(
      () => _i104.CategoriesBloc(get<_i78.GetCategories>()),
      registerFor: {_prod, _dev});
  gh.factory<_i105.CategoryDetailBloc>(
      () => _i105.CategoryDetailBloc(get<_i83.GetTechniquesByCategory>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i106.CategoryFormBloc, _i106.CategoryFormState?, dynamic>(
      (initialState, _) => _i106.CategoryFormBloc(
          initialState, get<_i69.CreateCategory>(), get<_i64.UpdateCategory>()),
      registerFor: {_prod, _dev});
  gh.factory<_i107.CategoryLocalizationBloc>(
      () =>
          _i107.CategoryLocalizationBloc(get<_i79.GetCategoryLocalizedData>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i108.DeleteDownloadedTechnique>(
      () => _i108.DeleteDownloadedTechnique(get<_i87.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i109.DownloadTechnique>(
      () => _i109.DownloadTechnique(get<_i87.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i110.GetDownloadedTechniques>(
      () => _i110.GetDownloadedTechniques(get<_i87.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i111.GetMostRecentTechniques>(
      () => _i111.GetMostRecentTechniques(get<_i87.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i112.GetTechniqueById>(
      () => _i112.GetTechniqueById(get<_i87.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i113.GetTechniques>(
      () => _i113.GetTechniques(get<_i87.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i114.GetTechniquesByCategory>(
      () => _i114.GetTechniquesByCategory(get<_i87.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i115.MostRecentTechniquesBloc>(
      () =>
          _i115.MostRecentTechniquesBloc(get<_i111.GetMostRecentTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i116.TechniqueBloc>(
      () => _i116.TechniqueBloc(get<_i112.GetTechniqueById>()),
      registerFor: {_prod, _dev});
  gh.factory<_i117.TechniqueLocalStorageBloc>(
      () => _i117.TechniqueLocalStorageBloc(
          get<_i109.DownloadTechnique>(),
          get<_i110.GetDownloadedTechniques>(),
          get<_i108.DeleteDownloadedTechnique>()),
      registerFor: {_prod, _dev});
  return get;
}
