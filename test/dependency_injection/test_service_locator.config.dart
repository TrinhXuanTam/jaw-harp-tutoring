// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jews_harp/core/BLoCs/connectivity/connectivity_bloc.dart'
    as _i5;
import 'package:jews_harp/core/BLoCs/errors/error_bloc.dart' as _i6;
import 'package:jews_harp/core/BLoCs/hide_field_input/hide_field_input_bloc.dart'
    as _i17;
import 'package:jews_harp/core/BLoCs/toggle_switch/toggle_switch_bloc.dart'
    as _i84;
import 'package:jews_harp/features/admin/application/use_cases/create_category.dart'
    as _i90;
import 'package:jews_harp/features/admin/application/use_cases/create_technique.dart'
    as _i91;
import 'package:jews_harp/features/admin/application/use_cases/get_all_categories.dart'
    as _i98;
import 'package:jews_harp/features/admin/application/use_cases/get_all_techniques.dart'
    as _i99;
import 'package:jews_harp/features/admin/application/use_cases/get_category_localized_data.dart'
    as _i102;
import 'package:jews_harp/features/admin/application/use_cases/get_hidden_categories.dart'
    as _i105;
import 'package:jews_harp/features/admin/application/use_cases/get_technique_localized_data.dart'
    as _i108;
import 'package:jews_harp/features/admin/application/use_cases/get_techniques_by_category.dart'
    as _i110;
import 'package:jews_harp/features/admin/application/use_cases/get_visible_categories.dart'
    as _i112;
import 'package:jews_harp/features/admin/application/use_cases/pick_image.dart'
    as _i71;
import 'package:jews_harp/features/admin/application/use_cases/pick_video.dart'
    as _i72;
import 'package:jews_harp/features/admin/application/use_cases/update_category.dart'
    as _i85;
import 'package:jews_harp/features/admin/application/use_cases/update_technique.dart'
    as _i86;
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart'
    as _i18;
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart'
    as _i29;
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart'
    as _i7;
import 'package:jews_harp/features/admin/infrastructure/repositories/category_admin_repository.dart'
    as _i24;
import 'package:jews_harp/features/admin/infrastructure/repositories/technique_admin_repository.dart'
    as _i32;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_detail/category_detail_bloc.dart'
    as _i129;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart'
    as _i130;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_localization/category_localization_bloc.dart'
    as _i131;
import 'package:jews_harp/features/admin/presentation/BLoCs/hidden_categories/hidden_categories_bloc.dart'
    as _i114;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_form/technique_form_bloc.dart'
    as _i122;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_list/technique_list_bloc.dart'
    as _i123;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_localization/technique_localization_bloc.dart'
    as _i125;
import 'package:jews_harp/features/admin/presentation/BLoCs/thumbnail_picker/thumbnail_picker_bloc.dart'
    as _i83;
import 'package:jews_harp/features/admin/presentation/BLoCs/video_picker/video_picker_bloc.dart'
    as _i88;
import 'package:jews_harp/features/admin/presentation/BLoCs/visible_categories/visible_categories_bloc.dart'
    as _i127;
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart'
    as _i94;
import 'package:jews_harp/features/auth/application/use_cases/facebook_authentication.dart'
    as _i97;
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart'
    as _i100;
import 'package:jews_harp/features/auth/application/use_cases/get_current_user.dart'
    as _i103;
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart'
    as _i113;
import 'package:jews_harp/features/auth/application/use_cases/link_email_provider.dart'
    as _i65;
import 'package:jews_harp/features/auth/application/use_cases/link_facebook_provider.dart'
    as _i66;
import 'package:jews_harp/features/auth/application/use_cases/password_reset.dart'
    as _i68;
import 'package:jews_harp/features/auth/application/use_cases/reload_user.dart'
    as _i75;
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart'
    as _i77;
import 'package:jews_harp/features/auth/application/use_cases/set_locale.dart'
    as _i78;
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart'
    as _i79;
import 'package:jews_harp/features/auth/application/use_cases/sign_up.dart'
    as _i80;
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart'
    as _i44;
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart'
    as _i56;
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart'
    as _i10;
import 'package:jews_harp/features/auth/infrastructure/external_services/firebase_auth.dart'
    as _i12;
import 'package:jews_harp/features/auth/infrastructure/facades/user_facade.dart'
    as _i51;
import 'package:jews_harp/features/auth/infrastructure/repositories/user_repository.dart'
    as _i59;
import 'package:jews_harp/features/auth/presentation/BLoCs/auth_state/auth_bloc.dart'
    as _i89;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_form/email_form_bloc.dart'
    as _i95;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart'
    as _i96;
import 'package:jews_harp/features/auth/presentation/BLoCs/link_providers/link_providers_bloc.dart'
    as _i117;
import 'package:jews_harp/features/auth/presentation/BLoCs/password_reset/password_reset_bloc.dart'
    as _i69;
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart'
    as _i119;
import 'package:jews_harp/features/auth/presentation/BLoCs/splash_screen/splash_screen_bloc.dart'
    as _i120;
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart'
    as _i126;
import 'package:jews_harp/features/user_section/application/delete_downloaded_technique.dart'
    as _i92;
import 'package:jews_harp/features/user_section/application/download_technique.dart'
    as _i93;
import 'package:jews_harp/features/user_section/application/get_categories.dart'
    as _i101;
import 'package:jews_harp/features/user_section/application/get_downloaded_techniques.dart'
    as _i104;
import 'package:jews_harp/features/user_section/application/get_most_recent_techniques.dart'
    as _i106;
import 'package:jews_harp/features/user_section/application/get_technique_by_Id.dart'
    as _i107;
import 'package:jews_harp/features/user_section/application/get_techniques.dart'
    as _i109;
import 'package:jews_harp/features/user_section/application/get_techniques_by_category.dart'
    as _i111;
import 'package:jews_harp/features/user_section/application/mark_technique_as_favorite.dart'
    as _i67;
import 'package:jews_harp/features/user_section/application/purchase_technique.dart'
    as _i73;
import 'package:jews_harp/features/user_section/application/remove_technique_from_favorites.dart'
    as _i76;
import 'package:jews_harp/features/user_section/domain/facade_interfaces/user_section_facade.dart'
    as _i61;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/category_repository.dart'
    as _i26;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart'
    as _i36;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/category_local_data_source.dart'
    as _i3;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart'
    as _i14;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/technique_local_data_source.dart'
    as _i82;
import 'package:jews_harp/features/user_section/infrastructure/external_services/payment_service.dart'
    as _i70;
import 'package:jews_harp/features/user_section/infrastructure/facades/user_section_facade.dart'
    as _i116;
import 'package:jews_harp/features/user_section/infrastructure/repositories/category_repository.dart'
    as _i28;
import 'package:jews_harp/features/user_section/infrastructure/repositories/technique_repository.dart'
    as _i115;
import 'package:jews_harp/features/user_section/presentation/BLoCs/categories/categories_bloc.dart'
    as _i128;
import 'package:jews_harp/features/user_section/presentation/BLoCs/most_recent_techniques/most_recent_techniques_bloc.dart'
    as _i118;
import 'package:jews_harp/features/user_section/presentation/BLoCs/purchase_technique/purchase_technique_bloc.dart'
    as _i74;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique/technique_bloc.dart'
    as _i121;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_detail/technique_detail_bloc.dart'
    as _i81;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_local_storage/technique_local_storage_bloc.dart'
    as _i124;
import 'package:jews_harp/features/user_section/presentation/BLoCs/user_section_navigation/user_section_navigation_bloc.dart'
    as _i87;

import '../unit/admin/repositories/category_admin_repository_test.dart' as _i9;
import '../unit/admin/repositories/technique_admin_repository_test.dart' as _i8;
import '../unit/admin/use_cases/create_category_test.dart' as _i23;
import '../unit/admin/use_cases/create_technique_test.dart' as _i35;
import '../unit/admin/use_cases/get_all_categories_test.dart' as _i25;
import '../unit/admin/use_cases/get_all_techniques_test.dart' as _i34;
import '../unit/admin/use_cases/get_category_localized_data_test.dart' as _i22;
import '../unit/admin/use_cases/get_hidden_categories_test.dart' as _i19;
import '../unit/admin/use_cases/get_technique_localized_data_test.dart' as _i33;
import '../unit/admin/use_cases/get_techniques_by_category_test.dart' as _i30;
import '../unit/admin/use_cases/get_visible_categories_test.dart' as _i20;
import '../unit/admin/use_cases/update_category_test.dart' as _i21;
import '../unit/admin/use_cases/update_technique_test.dart' as _i31;
import '../unit/auth/facades/user_auth_facade_test.dart' as _i13;
import '../unit/auth/repositories/user_repository_test.dart' as _i11;
import '../unit/auth/use_cases/email_authentication_test.dart' as _i52;
import '../unit/auth/use_cases/facebook_authentication_test.dart' as _i50;
import '../unit/auth/use_cases/get_authentication_providers_test.dart' as _i60;
import '../unit/auth/use_cases/get_current_user_test.dart' as _i58;
import '../unit/auth/use_cases/google_authentication_test.dart' as _i47;
import '../unit/auth/use_cases/link_email_provider_test.dart' as _i46;
import '../unit/auth/use_cases/link_facebook_provider_test.dart' as _i45;
import '../unit/auth/use_cases/password_reset_test.dart' as _i54;
import '../unit/auth/use_cases/reload_user_test.dart' as _i57;
import '../unit/auth/use_cases/send_email_verification_test.dart' as _i48;
import '../unit/auth/use_cases/set_locale_test.dart' as _i53;
import '../unit/auth/use_cases/sign_out_test.dart' as _i55;
import '../unit/auth/use_cases/sign_up_test.dart' as _i49;
import '../unit/user_section/facades/user_section_facade_test.dart' as _i16;
import '../unit/user_section/repositories/category_repository_test.dart' as _i4;
import '../unit/user_section/repositories/technique_repository_test.dart'
    as _i15;
import '../unit/user_section/use_cases/delete_downloaded_technique_test.dart'
    as _i41;
import '../unit/user_section/use_cases/download_technique_test.dart' as _i43;
import '../unit/user_section/use_cases/get_categories_test.dart' as _i27;
import '../unit/user_section/use_cases/get_downloaded_techniques_test.dart'
    as _i42;
import '../unit/user_section/use_cases/get_most_recent_techniques_test.dart'
    as _i37;
import '../unit/user_section/use_cases/get_technique_by_Id_test.dart' as _i38;
import '../unit/user_section/use_cases/get_techniques_by_category.dart' as _i39;
import '../unit/user_section/use_cases/get_techniques_test.dart' as _i40;
import '../unit/user_section/use_cases/mark_technique_as_favorite_test.dart'
    as _i64;
import '../unit/user_section/use_cases/purchase_technique_test.dart' as _i63;
import '../unit/user_section/use_cases/remove_technique_from_favorites_test.dart'
    as _i62;

const String _category_repository_test_env = 'category_repository_test_env';
const String _prod = 'prod';
const String _dev = 'dev';
const String _technique_admin_repository_test_env =
    'technique_admin_repository_test_env';
const String _category_admin_repository_test_env =
    'category_admin_repository_test_env';
const String _user_auth_repository_test_env = 'user_auth_repository_test_env';
const String _user_auth_facade_test_env = 'user_auth_facade_test_env';
const String _technique_repository_test_env = 'technique_repository_test_env';
const String _user_section_facade_test_env = 'user_section_facade_test_env';
const String _get_hidden_categories_test_env = 'get_hidden_categories_test_env';
const String _get_visible_categories_test_env =
    'get_visible_categories_test_env';
const String _update_category_test_env = 'update_category_test_env';
const String _get_category_localized_data_test_env =
    'get_category_localized_data_test_env';
const String _create_category_test_env = 'create_category_test_env';
const String _get_all_categories_test_env = 'get_all_categories_test_env';
const String _get_categories_test_env = 'get_categories_test_env';
const String _get_techniques_by_category_test_env =
    'get_techniques_by_category_test_env';
const String _update_technique_test_env = 'update_technique_test_env';
const String _get_technique_localized_data_test_env =
    'get_technique_localized_data_test_env';
const String _get_all_techniques_test_env = 'get_all_techniques_test_env';
const String _create_technique_test_env = 'create_technique_test_env';
const String _get_most_recent_techniques_test_env =
    'get_most_recent_techniques_test_env';
const String _get_technique_by_id_test_env = 'get_technique_by_id_test_env';
const String _get_published_techniques_by_category_test_env =
    'get_published_techniques_by_category_test_env';
const String _get_techniques_test_env = 'get_techniques_test_env';
const String _delete_downloaded_technique_test_env =
    'delete_downloaded_technique_test_env';
const String _get_downloaded_techniques_test_env =
    'get_downloaded_techniques_test_env';
const String _download_technique_test_env = 'download_technique_test_env';
const String _link_facebook_provider_test_env =
    'link_facebook_provider_test_env';
const String _link_email_provider_test_env = 'link_email_provider_test_env';
const String _google_authentication_test_env = 'google_authentication_test_env';
const String _send_email_verification_test_env =
    'send_email_verification_test_env';
const String _sign_up_test_env = 'sign_up_test_env';
const String _facebook_authentication_test_env =
    'facebook_authentication_test_env';
const String _email_authentication_test_env = 'email_authentication_test_env';
const String _set_locale_test_env = 'set_locale_test_env';
const String _password_reset_test_env = 'password_reset_test_env';
const String _sign_out_test_env = 'sign_out_test_env';
const String _reload_user_test_env = 'reload_user_test_env';
const String _get_current_user_test_env = 'get_current_user_test_env';
const String _get_authentication_providers_test_env =
    'get_authentication_providers_test_env';
const String _remove_technique_from_favorites_test_env =
    'remove_technique_from_favorites_test_env';
const String _purchase_technique_test_env = 'purchase_technique_test_env';
const String _mark_technique_as_favorite_test_env =
    'mark_technique_as_favorite_test_env';
const String _pick_image_test_env = 'pick_image_test_env';
const String _pick_video_test_env = 'pick_video_test_env';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt testInitGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.CategoryLocalDataSource>(
      () => _i4.CategoryLocalDataSourceMock(),
      registerFor: {_category_repository_test_env});
  gh.lazySingleton<_i3.CategoryLocalDataSource>(
      () => _i3.CategoryLocalDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i5.ConnectivityBloc>(() => _i5.ConnectivityBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i6.ErrorBloc>(() => _i6.ErrorBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i7.FirebaseAdminDataSource>(
      () => _i8.FirebaseAdminDataSourceMock(),
      registerFor: {_technique_admin_repository_test_env});
  gh.lazySingleton<_i7.FirebaseAdminDataSource>(
      () => _i9.FirebaseAdminDataSourceMock(),
      registerFor: {_category_admin_repository_test_env});
  gh.lazySingleton<_i7.FirebaseAdminDataSource>(
      () => _i7.FirebaseAdminDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i10.FirebaseAuthDataSource>(
      () => _i11.FirebaseAuthDataSourceMock(),
      registerFor: {_user_auth_repository_test_env});
  gh.lazySingleton<_i10.FirebaseAuthDataSource>(
      () => _i10.FirebaseAuthDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i12.FirebaseAuthService>(() => _i12.FirebaseAuthService(),
      registerFor: {_prod});
  gh.lazySingleton<_i12.FirebaseAuthService>(
      () => _i13.FirebaseAuthServiceMock(),
      registerFor: {_user_auth_facade_test_env});
  gh.lazySingleton<_i14.FirebaseUserSectionDataSource>(
      () => _i15.FirebaseUserSectionDataSourceMock(),
      registerFor: {_technique_repository_test_env});
  gh.lazySingleton<_i14.FirebaseUserSectionDataSource>(
      () => _i16.FirebaseUserSectionDataSourceMock(),
      registerFor: {_user_section_facade_test_env});
  gh.lazySingleton<_i14.FirebaseUserSectionDataSource>(
      () => _i4.FirebaseUserSectionDataSourceMock(),
      registerFor: {_category_repository_test_env});
  gh.lazySingleton<_i14.FirebaseUserSectionDataSource>(
      () => _i14.FirebaseUserSectionDataSource(),
      registerFor: {_prod});
  gh.factory<_i17.HideFieldInputBloc>(() => _i17.HideFieldInputBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i18.ICategoryAdminRepository>(
      () => _i19.CategoryAdminRepository(),
      registerFor: {_get_hidden_categories_test_env});
  gh.lazySingleton<_i18.ICategoryAdminRepository>(
      () => _i20.CategoryAdminRepository(),
      registerFor: {_get_visible_categories_test_env});
  gh.lazySingleton<_i18.ICategoryAdminRepository>(
      () => _i21.CategoryAdminRepository(),
      registerFor: {_update_category_test_env});
  gh.lazySingleton<_i18.ICategoryAdminRepository>(
      () => _i22.CategoryAdminRepository(),
      registerFor: {_get_category_localized_data_test_env});
  gh.lazySingleton<_i18.ICategoryAdminRepository>(
      () => _i23.CategoryAdminRepository(),
      registerFor: {_create_category_test_env});
  gh.lazySingleton<_i18.ICategoryAdminRepository>(
      () => _i24.CategoryAdminRepository(get<_i7.FirebaseAdminDataSource>()),
      registerFor: {_prod, _category_admin_repository_test_env});
  gh.lazySingleton<_i18.ICategoryAdminRepository>(
      () => _i25.CategoryAdminRepository(),
      registerFor: {_get_all_categories_test_env});
  gh.lazySingleton<_i26.ICategoryRepository>(
      () => _i27.CategoryRepositoryMock(),
      registerFor: {_get_categories_test_env});
  gh.lazySingleton<_i26.ICategoryRepository>(
      () => _i28.CategoryRepository(get<_i14.FirebaseUserSectionDataSource>(),
          get<_i3.CategoryLocalDataSource>()),
      registerFor: {_prod, _category_repository_test_env});
  gh.lazySingleton<_i29.ITechniqueAdminRepository>(
      () => _i30.TechniqueAdminRepository(),
      registerFor: {_get_techniques_by_category_test_env});
  gh.lazySingleton<_i29.ITechniqueAdminRepository>(
      () => _i31.TechniqueAdminRepository(),
      registerFor: {_update_technique_test_env});
  gh.lazySingleton<_i29.ITechniqueAdminRepository>(
      () => _i32.TechniqueAdminRepository(get<_i7.FirebaseAdminDataSource>()),
      registerFor: {_prod, _technique_admin_repository_test_env});
  gh.lazySingleton<_i29.ITechniqueAdminRepository>(
      () => _i33.TechniqueAdminRepository(),
      registerFor: {_get_technique_localized_data_test_env});
  gh.lazySingleton<_i29.ITechniqueAdminRepository>(
      () => _i34.TechniqueAdminRepository(),
      registerFor: {_get_all_techniques_test_env});
  gh.lazySingleton<_i29.ITechniqueAdminRepository>(
      () => _i35.TechniqueAdminRepository(),
      registerFor: {_create_technique_test_env});
  gh.lazySingleton<_i36.ITechniqueRepository>(
      () => _i37.TechniqueRepositoryMock(),
      registerFor: {_get_most_recent_techniques_test_env});
  gh.lazySingleton<_i36.ITechniqueRepository>(
      () => _i38.TechniqueRepositoryMock(),
      registerFor: {_get_technique_by_id_test_env});
  gh.lazySingleton<_i36.ITechniqueRepository>(
      () => _i39.TechniqueRepositoryMock(),
      registerFor: {_get_published_techniques_by_category_test_env});
  gh.lazySingleton<_i36.ITechniqueRepository>(
      () => _i40.TechniqueRepositoryMock(),
      registerFor: {_get_techniques_test_env});
  gh.lazySingleton<_i36.ITechniqueRepository>(
      () => _i41.TechniqueRepositoryMock(),
      registerFor: {_delete_downloaded_technique_test_env});
  gh.lazySingleton<_i36.ITechniqueRepository>(
      () => _i42.TechniqueRepositoryMock(),
      registerFor: {_get_downloaded_techniques_test_env});
  gh.lazySingleton<_i36.ITechniqueRepository>(
      () => _i43.TechniqueRepositoryMock(),
      registerFor: {_download_technique_test_env});
  gh.lazySingleton<_i44.IUserAuthFacade>(() => _i45.UserAuthFacade(),
      registerFor: {_link_facebook_provider_test_env});
  gh.lazySingleton<_i44.IUserAuthFacade>(() => _i46.UserAuthFacade(),
      registerFor: {_link_email_provider_test_env});
  gh.lazySingleton<_i44.IUserAuthFacade>(() => _i47.UserAuthFacadeMock(),
      registerFor: {_google_authentication_test_env});
  gh.lazySingleton<_i44.IUserAuthFacade>(() => _i48.UserAuthFacade(),
      registerFor: {_send_email_verification_test_env});
  gh.lazySingleton<_i44.IUserAuthFacade>(() => _i49.UserAuthFacade(),
      registerFor: {_sign_up_test_env});
  gh.lazySingleton<_i44.IUserAuthFacade>(() => _i50.UserAuthFacade(),
      registerFor: {_facebook_authentication_test_env});
  gh.lazySingleton<_i44.IUserAuthFacade>(
      () => _i51.UserAuthFacade(get<_i12.FirebaseAuthService>()),
      registerFor: {_prod, _user_auth_facade_test_env});
  gh.lazySingleton<_i44.IUserAuthFacade>(() => _i52.UserAuthFacade(),
      registerFor: {_email_authentication_test_env});
  gh.lazySingleton<_i44.IUserAuthFacade>(() => _i53.UserAuthFacade(),
      registerFor: {_set_locale_test_env});
  gh.lazySingleton<_i44.IUserAuthFacade>(() => _i54.UserAuthFacade(),
      registerFor: {_password_reset_test_env});
  gh.lazySingleton<_i44.IUserAuthFacade>(() => _i55.UserAuthFacade(),
      registerFor: {_sign_out_test_env});
  gh.lazySingleton<_i56.IUserAuthRepository>(
      () => _i57.UserAuthRepositoryMock(),
      registerFor: {_reload_user_test_env});
  gh.lazySingleton<_i56.IUserAuthRepository>(
      () => _i58.UserAuthRepositoryMock(),
      registerFor: {_get_current_user_test_env});
  gh.lazySingleton<_i56.IUserAuthRepository>(
      () => _i59.UserAuthRepository(get<_i10.FirebaseAuthDataSource>()),
      registerFor: {_prod, _user_auth_repository_test_env});
  gh.lazySingleton<_i56.IUserAuthRepository>(
      () => _i60.UserAuthRepositoryMock(),
      registerFor: {_get_authentication_providers_test_env});
  gh.lazySingleton<_i61.IUserSectionFacade>(() => _i62.UserSectionFacadeMock(),
      registerFor: {_remove_technique_from_favorites_test_env});
  gh.lazySingleton<_i61.IUserSectionFacade>(() => _i63.UserSectionFacadeMock(),
      registerFor: {_purchase_technique_test_env});
  gh.lazySingleton<_i61.IUserSectionFacade>(() => _i64.UserSectionFacadeMock(),
      registerFor: {_mark_technique_as_favorite_test_env});
  gh.lazySingleton<_i65.LinkEmailProvider>(
      () => _i65.LinkEmailProvider(get<_i44.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _link_email_provider_test_env});
  gh.lazySingleton<_i66.LinkFacebookProvider>(
      () => _i66.LinkFacebookProvider(get<_i44.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _link_facebook_provider_test_env});
  gh.lazySingleton<_i67.MarkTechniqueAsFavorite>(
      () => _i67.MarkTechniqueAsFavorite(get<_i61.IUserSectionFacade>()),
      registerFor: {_prod, _dev, _mark_technique_as_favorite_test_env});
  gh.lazySingleton<_i58.OfflineGetCurrentUser>(
      () => _i58.OfflineGetCurrentUser(get<_i56.IUserAuthRepository>()),
      registerFor: {_get_current_user_test_env});
  gh.lazySingleton<_i58.OnlineGetCurrentUser>(
      () => _i58.OnlineGetCurrentUser(get<_i56.IUserAuthRepository>()),
      registerFor: {_get_current_user_test_env});
  gh.lazySingleton<_i68.PasswordReset>(
      () => _i68.PasswordReset(get<_i44.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _password_reset_test_env});
  gh.factory<_i69.PasswordResetBloc>(
      () => _i69.PasswordResetBloc(get<_i68.PasswordReset>(),
          get<_i5.ConnectivityBloc>(), get<_i6.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i70.PaymentService>(() => _i70.PaymentService(),
      registerFor: {_prod});
  gh.lazySingleton<_i70.PaymentService>(() => _i16.PaymentServiceMock(),
      registerFor: {_user_section_facade_test_env});
  gh.lazySingleton<_i71.PickImage>(() => _i71.PickImage(),
      registerFor: {_prod, _dev, _pick_image_test_env});
  gh.lazySingleton<_i72.PickVideo>(() => _i72.PickVideo(),
      registerFor: {_prod, _dev, _pick_video_test_env});
  gh.lazySingleton<_i73.PurchaseTechnique>(
      () => _i73.PurchaseTechnique(get<_i61.IUserSectionFacade>()),
      registerFor: {_prod, _dev, _purchase_technique_test_env});
  gh.factory<_i74.PurchaseTechniqueBloc>(
      () => _i74.PurchaseTechniqueBloc(
          get<_i73.PurchaseTechnique>(), get<_i6.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i75.ReloadUser>(
      () => _i75.ReloadUser(get<_i56.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _reload_user_test_env});
  gh.lazySingleton<_i76.RemoveTechniqueFromFavorites>(
      () => _i76.RemoveTechniqueFromFavorites(get<_i61.IUserSectionFacade>()),
      registerFor: {_prod, _dev, _remove_technique_from_favorites_test_env});
  gh.lazySingleton<_i77.SendEmailVerification>(
      () => _i77.SendEmailVerification(get<_i44.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _send_email_verification_test_env});
  gh.lazySingleton<_i78.SetLocale>(
      () => _i78.SetLocale(get<_i44.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _set_locale_test_env});
  gh.lazySingleton<_i79.SignOut>(
      () => _i79.SignOut(get<_i44.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _sign_out_test_env});
  gh.lazySingleton<_i80.SignUp>(() => _i80.SignUp(get<_i44.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _sign_up_test_env});
  gh.factory<_i81.TechniqueDetailBloc>(
      () => _i81.TechniqueDetailBloc(get<_i67.MarkTechniqueAsFavorite>(),
          get<_i76.RemoveTechniqueFromFavorites>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i82.TechniqueLocalDataSource>(
      () => _i82.TechniqueLocalDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i82.TechniqueLocalDataSource>(
      () => _i15.TechniqueLocalDataSourceMock(),
      registerFor: {_technique_repository_test_env});
  gh.factory<_i83.ThumbnailPickerBloc>(
      () => _i83.ThumbnailPickerBloc(get<_i71.PickImage>()),
      registerFor: {_prod, _dev});
  gh.factory<_i84.ToggleSwitchBloc>(() => _i84.ToggleSwitchBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i85.UpdateCategory>(
      () => _i85.UpdateCategory(get<_i18.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev, _update_category_test_env});
  gh.lazySingleton<_i86.UpdateTechnique>(
      () => _i86.UpdateTechnique(get<_i29.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev, _update_technique_test_env});
  gh.factory<_i87.UserSectionNavigationBloc>(
      () => _i87.UserSectionNavigationBloc(),
      registerFor: {_prod, _dev});
  gh.factory<_i88.VideoPickerBloc>(
      () => _i88.VideoPickerBloc(get<_i72.PickVideo>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i89.AuthBloc>(
      () => _i89.AuthBloc(get<_i75.ReloadUser>(), get<_i79.SignOut>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i90.CreateCategory>(
      () => _i90.CreateCategory(get<_i18.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev, _create_category_test_env});
  gh.lazySingleton<_i91.CreateTechnique>(
      () => _i91.CreateTechnique(get<_i29.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev, _create_technique_test_env});
  gh.lazySingleton<_i92.DeleteDownloadedTechnique>(
      () => _i92.DeleteDownloadedTechnique(get<_i36.ITechniqueRepository>()),
      registerFor: {_prod, _dev, _delete_downloaded_technique_test_env});
  gh.lazySingleton<_i93.DownloadTechnique>(
      () => _i93.DownloadTechnique(get<_i36.ITechniqueRepository>()),
      registerFor: {_prod, _dev, _download_technique_test_env});
  gh.lazySingleton<_i94.EmailAuthentication>(
      () => _i94.EmailAuthentication(get<_i44.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _email_authentication_test_env});
  gh.factory<_i95.EmailFormBloc>(() => _i95.EmailFormBloc(
      get<_i94.EmailAuthentication>(),
      get<_i5.ConnectivityBloc>(),
      get<_i6.ErrorBloc>(),
      get<_i89.AuthBloc>()));
  gh.factory<_i96.EmailVerificationBloc>(
      () => _i96.EmailVerificationBloc(
          get<_i77.SendEmailVerification>(),
          get<_i5.ConnectivityBloc>(),
          get<_i75.ReloadUser>(),
          get<_i6.ErrorBloc>(),
          get<_i89.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i53.EnglishCzechSupportSetLocale>(
      () => _i53.EnglishCzechSupportSetLocale(get<_i44.IUserAuthFacade>()),
      registerFor: {_set_locale_test_env});
  gh.lazySingleton<_i97.FacebookAuthentication>(
      () => _i97.FacebookAuthentication(get<_i44.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _facebook_authentication_test_env});
  gh.lazySingleton<_i98.GetAllCategories>(
      () => _i98.GetAllCategories(get<_i18.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev, _get_all_categories_test_env});
  gh.lazySingleton<_i99.GetAllTechniques>(
      () => _i99.GetAllTechniques(get<_i29.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev, _get_all_techniques_test_env});
  gh.lazySingleton<_i100.GetAuthProviders>(
      () => _i100.GetAuthProviders(get<_i56.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _get_authentication_providers_test_env});
  gh.lazySingleton<_i101.GetCategories>(
      () => _i101.GetCategories(get<_i26.ICategoryRepository>()),
      registerFor: {_prod, _dev, _get_categories_test_env});
  gh.lazySingleton<_i102.GetCategoryLocalizedData>(
      () =>
          _i102.GetCategoryLocalizedData(get<_i18.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev, _get_category_localized_data_test_env});
  gh.lazySingleton<_i103.GetCurrentUser>(
      () => _i103.GetCurrentUser(get<_i56.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _get_current_user_test_env});
  gh.lazySingleton<_i104.GetDownloadedTechniques>(
      () => _i104.GetDownloadedTechniques(get<_i36.ITechniqueRepository>()),
      registerFor: {_prod, _dev, _get_downloaded_techniques_test_env});
  gh.lazySingleton<_i105.GetHiddenCategories>(
      () => _i105.GetHiddenCategories(get<_i18.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev, _get_hidden_categories_test_env});
  gh.lazySingleton<_i106.GetMostRecentTechniques>(
      () => _i106.GetMostRecentTechniques(get<_i36.ITechniqueRepository>()),
      registerFor: {_prod, _dev, _get_most_recent_techniques_test_env});
  gh.lazySingleton<_i107.GetTechniqueById>(
      () => _i107.GetTechniqueById(get<_i36.ITechniqueRepository>()),
      registerFor: {_prod, _dev, _get_technique_by_id_test_env});
  gh.lazySingleton<_i108.GetTechniqueLocalizedData>(
      () => _i108.GetTechniqueLocalizedData(
          get<_i29.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev, _get_technique_localized_data_test_env});
  gh.lazySingleton<_i109.GetTechniques>(
      () => _i109.GetTechniques(get<_i36.ITechniqueRepository>()),
      registerFor: {_prod, _dev, _get_techniques_test_env});
  gh.lazySingleton<_i110.GetTechniquesByCategory>(
      () =>
          _i110.GetTechniquesByCategory(get<_i29.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev, _get_techniques_by_category_test_env});
  gh.lazySingleton<_i111.GetTechniquesByCategory>(
      () => _i111.GetTechniquesByCategory(get<_i36.ITechniqueRepository>()),
      registerFor: {
        _prod,
        _dev,
        _get_published_techniques_by_category_test_env
      });
  gh.lazySingleton<_i112.GetVisibleCategories>(
      () => _i112.GetVisibleCategories(get<_i18.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev, _get_visible_categories_test_env});
  gh.lazySingleton<_i113.GoogleAuthentication>(
      () => _i113.GoogleAuthentication(get<_i44.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _google_authentication_test_env});
  gh.factory<_i114.HiddenCategoriesBloc>(
      () => _i114.HiddenCategoriesBloc(get<_i105.GetHiddenCategories>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i36.ITechniqueRepository>(
      () => _i115.TechniqueRepository(get<_i14.FirebaseUserSectionDataSource>(),
          get<_i82.TechniqueLocalDataSource>()),
      registerFor: {_prod, _technique_repository_test_env});
  gh.lazySingleton<_i61.IUserSectionFacade>(
      () => _i116.UserSectionFacade(get<_i70.PaymentService>(),
          get<_i14.FirebaseUserSectionDataSource>()),
      registerFor: {_prod, _user_section_facade_test_env});
  gh.factoryParam<_i117.LinkProvidersBloc, _i117.LinkProvidersState?, dynamic>(
      (initialState, _) => _i117.LinkProvidersBloc(
          initialState,
          get<_i97.FacebookAuthentication>(),
          get<_i113.GoogleAuthentication>(),
          get<_i94.EmailAuthentication>(),
          get<_i66.LinkFacebookProvider>(),
          get<_i65.LinkEmailProvider>(),
          get<_i79.SignOut>(),
          get<_i6.ErrorBloc>(),
          get<_i89.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i118.MostRecentTechniquesBloc>(
      () =>
          _i118.MostRecentTechniquesBloc(get<_i106.GetMostRecentTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i119.SignUpBloc>(
      () => _i119.SignUpBloc(
          get<_i80.SignUp>(),
          get<_i100.GetAuthProviders>(),
          get<_i5.ConnectivityBloc>(),
          get<_i6.ErrorBloc>(),
          get<_i89.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i120.SplashScreenBloc>(
      () => _i120.SplashScreenBloc(get<_i103.GetCurrentUser>(),
          get<_i78.SetLocale>(), get<_i89.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i121.TechniqueBloc>(
      () => _i121.TechniqueBloc(get<_i107.GetTechniqueById>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i122.TechniqueFormBloc, _i122.TechniqueFormState?, dynamic>(
      (initialState, _) => _i122.TechniqueFormBloc(
          initialState,
          get<_i98.GetAllCategories>(),
          get<_i91.CreateTechnique>(),
          get<_i86.UpdateTechnique>(),
          get<_i6.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i123.TechniqueListBloc>(
      () => _i123.TechniqueListBloc(get<_i99.GetAllTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i124.TechniqueLocalStorageBloc>(
      () => _i124.TechniqueLocalStorageBloc(
          get<_i93.DownloadTechnique>(),
          get<_i104.GetDownloadedTechniques>(),
          get<_i92.DeleteDownloadedTechnique>()),
      registerFor: {_prod, _dev});
  gh.factory<_i125.TechniqueLocalizationBloc>(
      () => _i125.TechniqueLocalizationBloc(
          get<_i108.GetTechniqueLocalizedData>()),
      registerFor: {_prod, _dev});
  gh.factory<_i126.ThirdPartyAuthBloc>(
      () => _i126.ThirdPartyAuthBloc(
          get<_i97.FacebookAuthentication>(),
          get<_i113.GoogleAuthentication>(),
          get<_i100.GetAuthProviders>(),
          get<_i89.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i127.VisibleCategoriesBloc>(
      () => _i127.VisibleCategoriesBloc(get<_i112.GetVisibleCategories>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i128.CategoriesBloc>(
      () => _i128.CategoriesBloc(get<_i101.GetCategories>()),
      registerFor: {_prod, _dev});
  gh.factory<_i129.CategoryDetailBloc>(
      () => _i129.CategoryDetailBloc(get<_i110.GetTechniquesByCategory>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i130.CategoryFormBloc, _i130.CategoryFormState?, dynamic>(
      (initialState, _) => _i130.CategoryFormBloc(
          initialState, get<_i90.CreateCategory>(), get<_i85.UpdateCategory>()),
      registerFor: {_prod, _dev});
  gh.factory<_i131.CategoryLocalizationBloc>(
      () =>
          _i131.CategoryLocalizationBloc(get<_i102.GetCategoryLocalizedData>()),
      registerFor: {_prod, _dev});
  return get;
}
