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
    as _i66;
import 'package:jews_harp/features/admin/application/use_cases/create_category.dart'
    as _i72;
import 'package:jews_harp/features/admin/application/use_cases/create_technique.dart'
    as _i73;
import 'package:jews_harp/features/admin/application/use_cases/get_all_categories.dart'
    as _i78;
import 'package:jews_harp/features/admin/application/use_cases/get_all_techniques.dart'
    as _i79;
import 'package:jews_harp/features/admin/application/use_cases/get_category_localized_data.dart'
    as _i82;
import 'package:jews_harp/features/admin/application/use_cases/get_hidden_categories.dart'
    as _i84;
import 'package:jews_harp/features/admin/application/use_cases/get_technique_localized_data.dart'
    as _i85;
import 'package:jews_harp/features/admin/application/use_cases/get_techniques_by_category.dart'
    as _i86;
import 'package:jews_harp/features/admin/application/use_cases/get_visible_categories.dart'
    as _i87;
import 'package:jews_harp/features/admin/application/use_cases/pick_image.dart'
    as _i57;
import 'package:jews_harp/features/admin/application/use_cases/pick_video.dart'
    as _i58;
import 'package:jews_harp/features/admin/application/use_cases/update_category.dart'
    as _i67;
import 'package:jews_harp/features/admin/application/use_cases/update_technique.dart'
    as _i68;
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart'
    as _i18;
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart'
    as _i28;
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart'
    as _i7;
import 'package:jews_harp/features/admin/infrastructure/repositories/category_admin_repository.dart'
    as _i25;
import 'package:jews_harp/features/admin/infrastructure/repositories/technique_admin_repository.dart'
    as _i33;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_detail/category_detail_bloc.dart'
    as _i108;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart'
    as _i109;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_localization/category_localization_bloc.dart'
    as _i110;
import 'package:jews_harp/features/admin/presentation/BLoCs/hidden_categories/hidden_categories_bloc.dart'
    as _i89;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_form/technique_form_bloc.dart'
    as _i102;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_list/technique_list_bloc.dart'
    as _i103;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_localization/technique_localization_bloc.dart'
    as _i104;
import 'package:jews_harp/features/admin/presentation/BLoCs/thumbnail_picker/thumbnail_picker_bloc.dart'
    as _i65;
import 'package:jews_harp/features/admin/presentation/BLoCs/video_picker/video_picker_bloc.dart'
    as _i70;
import 'package:jews_harp/features/admin/presentation/BLoCs/visible_categories/visible_categories_bloc.dart'
    as _i106;
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart'
    as _i74;
import 'package:jews_harp/features/auth/application/use_cases/facebook_authentication.dart'
    as _i77;
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart'
    as _i80;
import 'package:jews_harp/features/auth/application/use_cases/get_current_user.dart'
    as _i83;
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart'
    as _i88;
import 'package:jews_harp/features/auth/application/use_cases/link_email_provider.dart'
    as _i52;
import 'package:jews_harp/features/auth/application/use_cases/link_facebook_provider.dart'
    as _i53;
import 'package:jews_harp/features/auth/application/use_cases/password_reset.dart'
    as _i54;
import 'package:jews_harp/features/auth/application/use_cases/reload_user.dart'
    as _i59;
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart'
    as _i60;
import 'package:jews_harp/features/auth/application/use_cases/set_locale.dart'
    as _i61;
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart'
    as _i62;
import 'package:jews_harp/features/auth/application/use_cases/sign_up.dart'
    as _i63;
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart'
    as _i35;
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart'
    as _i47;
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart'
    as _i10;
import 'package:jews_harp/features/auth/infrastructure/external_services/firebase_auth.dart'
    as _i12;
import 'package:jews_harp/features/auth/infrastructure/facades/user_facade.dart'
    as _i36;
import 'package:jews_harp/features/auth/infrastructure/repositories/user_repository.dart'
    as _i50;
import 'package:jews_harp/features/auth/presentation/BLoCs/auth_state/auth_bloc.dart'
    as _i71;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_form/email_form_bloc.dart'
    as _i75;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart'
    as _i76;
import 'package:jews_harp/features/auth/presentation/BLoCs/link_providers/link_providers_bloc.dart'
    as _i94;
import 'package:jews_harp/features/auth/presentation/BLoCs/password_reset/password_reset_bloc.dart'
    as _i55;
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart'
    as _i99;
import 'package:jews_harp/features/auth/presentation/BLoCs/splash_screen/splash_screen_bloc.dart'
    as _i100;
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart'
    as _i105;
import 'package:jews_harp/features/user_section/application/delete_downloaded_technique.dart'
    as _i111;
import 'package:jews_harp/features/user_section/application/download_technique.dart'
    as _i112;
import 'package:jews_harp/features/user_section/application/get_categories.dart'
    as _i81;
import 'package:jews_harp/features/user_section/application/get_downloaded_techniques.dart'
    as _i113;
import 'package:jews_harp/features/user_section/application/get_most_recent_techniques.dart'
    as _i114;
import 'package:jews_harp/features/user_section/application/get_technique_by_Id.dart'
    as _i115;
import 'package:jews_harp/features/user_section/application/get_techniques.dart'
    as _i116;
import 'package:jews_harp/features/user_section/application/get_techniques_by_category.dart'
    as _i117;
import 'package:jews_harp/features/user_section/application/mark_technique_as_favorite.dart'
    as _i95;
import 'package:jews_harp/features/user_section/application/purchase_technique.dart'
    as _i96;
import 'package:jews_harp/features/user_section/application/remove_technique_from_favorites.dart'
    as _i98;
import 'package:jews_harp/features/user_section/domain/facade_interfaces/user_section_facade.dart'
    as _i92;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/category_repository.dart'
    as _i26;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart'
    as _i90;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/category_local_data_source.dart'
    as _i3;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart'
    as _i14;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/technique_local_data_source.dart'
    as _i64;
import 'package:jews_harp/features/user_section/infrastructure/external_services/payment_service.dart'
    as _i56;
import 'package:jews_harp/features/user_section/infrastructure/facades/user_section_facade.dart'
    as _i93;
import 'package:jews_harp/features/user_section/infrastructure/repositories/category_repository.dart'
    as _i27;
import 'package:jews_harp/features/user_section/infrastructure/repositories/technique_repository.dart'
    as _i91;
import 'package:jews_harp/features/user_section/presentation/BLoCs/categories/categories_bloc.dart'
    as _i107;
import 'package:jews_harp/features/user_section/presentation/BLoCs/most_recent_techniques/most_recent_techniques_bloc.dart'
    as _i118;
import 'package:jews_harp/features/user_section/presentation/BLoCs/purchase_technique/purchase_technique_bloc.dart'
    as _i97;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique/technique_bloc.dart'
    as _i119;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_detail/technique_detail_bloc.dart'
    as _i101;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_local_storage/technique_local_storage_bloc.dart'
    as _i120;
import 'package:jews_harp/features/user_section/presentation/BLoCs/user_section_navigation/user_section_navigation_bloc.dart'
    as _i69;

import '../unit/admin/repositories/category_admin_repository_test.dart' as _i9;
import '../unit/admin/repositories/technique_admin_repository_test.dart' as _i8;
import '../unit/admin/use_cases/create_category_test.dart' as _i24;
import '../unit/admin/use_cases/create_technique_test.dart' as _i31;
import '../unit/admin/use_cases/get_all_categories_test.dart' as _i22;
import '../unit/admin/use_cases/get_all_techniques_test.dart' as _i30;
import '../unit/admin/use_cases/get_category_localized_data_test.dart' as _i20;
import '../unit/admin/use_cases/get_hidden_categories_test.dart' as _i19;
import '../unit/admin/use_cases/get_technique_localized_data_test.dart' as _i34;
import '../unit/admin/use_cases/get_techniques_by_category_test.dart' as _i29;
import '../unit/admin/use_cases/get_visible_categories_test.dart' as _i23;
import '../unit/admin/use_cases/update_category_test.dart' as _i21;
import '../unit/admin/use_cases/update_technique_test.dart' as _i32;
import '../unit/auth/facades/user_auth_facade_test.dart' as _i13;
import '../unit/auth/repositories/user_repository_test.dart' as _i11;
import '../unit/auth/use_cases/email_authentication_test.dart' as _i42;
import '../unit/auth/use_cases/facebook_authentication_test.dart' as _i38;
import '../unit/auth/use_cases/get_authentication_providers_test.dart' as _i48;
import '../unit/auth/use_cases/get_current_user_test.dart' as _i49;
import '../unit/auth/use_cases/google_authentication_test.dart' as _i43;
import '../unit/auth/use_cases/link_email_provider_test.dart' as _i40;
import '../unit/auth/use_cases/link_facebook_provider_test.dart' as _i44;
import '../unit/auth/use_cases/password_reset_test.dart' as _i39;
import '../unit/auth/use_cases/reload_user_test.dart' as _i51;
import '../unit/auth/use_cases/send_email_verification_test.dart' as _i37;
import '../unit/auth/use_cases/set_locale_test.dart' as _i45;
import '../unit/auth/use_cases/sign_out_test.dart' as _i41;
import '../unit/auth/use_cases/sign_up_test.dart' as _i46;
import '../unit/user_section/facades/user_section_facade_test.dart' as _i15;
import '../unit/user_section/repositories/category_repository_test.dart' as _i4;
import '../unit/user_section/repositories/technique_repository_test.dart'
    as _i16;

const String _prod = 'prod';
const String _category_repository_test_env = 'category_repository_test_env';
const String _dev = 'dev';
const String _technique_admin_repository_test_env =
    'technique_admin_repository_test_env';
const String _category_admin_repository_test_env =
    'category_admin_repository_test_env';
const String _user_auth_repository_test_env = 'user_auth_repository_test_env';
const String _user_auth_facade_test_env = 'user_auth_facade_test_env';
const String _user_section_facade_test_env = 'user_section_facade_test_env';
const String _technique_repository_test_env = 'technique_repository_test_env';
const String _get_hidden_categories_test_env = 'get_hidden_categories_test_env';
const String _get_category_localized_data_test_env =
    'get_category_localized_data_test_env';
const String _update_category_test_env = 'update_category_test_env';
const String _get_all_categories_test_env = 'get_all_categories_test_env';
const String _get_visible_categories_test_env =
    'get_visible_categories_test_env';
const String _create_category_test_env = 'create_category_test_env';
const String _get_techniques_by_category_test_env =
    'get_techniques_by_category_test_env';
const String _get_all_techniques_test_env = 'get_all_techniques_test_env';
const String _create_technique_test_env = 'create_technique_test_env';
const String _update_technique_test_env = 'update_technique_test_env';
const String _get_technique_localized_data_test_env =
    'get_technique_localized_data_test_env';
const String _send_email_verification_test_env =
    'send_email_verification_test_env';
const String _facebook_authentication_test_env =
    'facebook_authentication_test_env';
const String _password_reset_test_env = 'password_reset_test_env';
const String _link_email_provider_test_env = 'link_email_provider_test_env';
const String _sign_out_test_env = 'sign_out_test_env';
const String _email_authentication_test_env = 'email_authentication_test_env';
const String _google_authentication_test_env = 'google_authentication_test_env';
const String _link_facebook_provider_test_env =
    'link_facebook_provider_test_env';
const String _set_locale_test_env = 'set_locale_test_env';
const String _sign_up_test_env = 'sign_up_test_env';
const String _get_authentication_providers_test_env =
    'get_authentication_providers_test_env';
const String _get_current_user_test_env = 'get_current_user_test_env';
const String _reload_user_test_env = 'reload_user_test_env';
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
  gh.lazySingleton<_i3.CategoryLocalDataSource>(
      () => _i4.CategoryLocalDataSourceMock(),
      registerFor: {_category_repository_test_env});
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
  gh.lazySingleton<_i12.FirebaseAuthService>(
      () => _i13.FirebaseAuthServiceMock(),
      registerFor: {_user_auth_facade_test_env});
  gh.lazySingleton<_i12.FirebaseAuthService>(() => _i12.FirebaseAuthService(),
      registerFor: {_prod});
  gh.lazySingleton<_i14.FirebaseUserSectionDataSource>(
      () => _i15.FirebaseUserSectionDataSourceMock(),
      registerFor: {_user_section_facade_test_env});
  gh.lazySingleton<_i14.FirebaseUserSectionDataSource>(
      () => _i4.FirebaseUserSectionDataSourceMock(),
      registerFor: {_category_repository_test_env});
  gh.lazySingleton<_i14.FirebaseUserSectionDataSource>(
      () => _i14.FirebaseUserSectionDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i14.FirebaseUserSectionDataSource>(
      () => _i16.FirebaseUserSectionDataSourceMock(),
      registerFor: {_technique_repository_test_env});
  gh.factory<_i17.HideFieldInputBloc>(() => _i17.HideFieldInputBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i18.ICategoryAdminRepository>(
      () => _i19.CategoryAdminRepository(),
      registerFor: {_get_hidden_categories_test_env});
  gh.lazySingleton<_i18.ICategoryAdminRepository>(
      () => _i20.CategoryAdminRepository(),
      registerFor: {_get_category_localized_data_test_env});
  gh.lazySingleton<_i18.ICategoryAdminRepository>(
      () => _i21.CategoryAdminRepository(),
      registerFor: {_update_category_test_env});
  gh.lazySingleton<_i18.ICategoryAdminRepository>(
      () => _i22.CategoryAdminRepository(),
      registerFor: {_get_all_categories_test_env});
  gh.lazySingleton<_i18.ICategoryAdminRepository>(
      () => _i23.CategoryAdminRepository(),
      registerFor: {_get_visible_categories_test_env});
  gh.lazySingleton<_i18.ICategoryAdminRepository>(
      () => _i24.CategoryAdminRepository(),
      registerFor: {_create_category_test_env});
  gh.lazySingleton<_i18.ICategoryAdminRepository>(
      () => _i25.CategoryAdminRepository(get<_i7.FirebaseAdminDataSource>()),
      registerFor: {_prod, _category_admin_repository_test_env});
  gh.lazySingleton<_i26.ICategoryRepository>(
      () => _i27.CategoryRepository(get<_i14.FirebaseUserSectionDataSource>(),
          get<_i3.CategoryLocalDataSource>()),
      registerFor: {_prod, _category_repository_test_env});
  gh.lazySingleton<_i28.ITechniqueAdminRepository>(
      () => _i29.TechniqueAdminRepository(),
      registerFor: {_get_techniques_by_category_test_env});
  gh.lazySingleton<_i28.ITechniqueAdminRepository>(
      () => _i30.TechniqueAdminRepository(),
      registerFor: {_get_all_techniques_test_env});
  gh.lazySingleton<_i28.ITechniqueAdminRepository>(
      () => _i31.TechniqueAdminRepository(),
      registerFor: {_create_technique_test_env});
  gh.lazySingleton<_i28.ITechniqueAdminRepository>(
      () => _i32.TechniqueAdminRepository(),
      registerFor: {_update_technique_test_env});
  gh.lazySingleton<_i28.ITechniqueAdminRepository>(
      () => _i33.TechniqueAdminRepository(get<_i7.FirebaseAdminDataSource>()),
      registerFor: {_prod, _technique_admin_repository_test_env});
  gh.lazySingleton<_i28.ITechniqueAdminRepository>(
      () => _i34.TechniqueAdminRepository(),
      registerFor: {_get_technique_localized_data_test_env});
  gh.lazySingleton<_i35.IUserAuthFacade>(
      () => _i36.UserAuthFacade(get<_i12.FirebaseAuthService>()),
      registerFor: {_prod, _user_auth_facade_test_env});
  gh.lazySingleton<_i35.IUserAuthFacade>(() => _i37.UserAuthFacade(),
      registerFor: {_send_email_verification_test_env});
  gh.lazySingleton<_i35.IUserAuthFacade>(() => _i38.UserAuthFacade(),
      registerFor: {_facebook_authentication_test_env});
  gh.lazySingleton<_i35.IUserAuthFacade>(() => _i39.UserAuthFacade(),
      registerFor: {_password_reset_test_env});
  gh.lazySingleton<_i35.IUserAuthFacade>(() => _i40.UserAuthFacade(),
      registerFor: {_link_email_provider_test_env});
  gh.lazySingleton<_i35.IUserAuthFacade>(() => _i41.UserAuthFacade(),
      registerFor: {_sign_out_test_env});
  gh.lazySingleton<_i35.IUserAuthFacade>(() => _i42.UserAuthFacade(),
      registerFor: {_email_authentication_test_env});
  gh.lazySingleton<_i35.IUserAuthFacade>(() => _i43.UserAuthFacadeMock(),
      registerFor: {_google_authentication_test_env});
  gh.lazySingleton<_i35.IUserAuthFacade>(() => _i44.UserAuthFacade(),
      registerFor: {_link_facebook_provider_test_env});
  gh.lazySingleton<_i35.IUserAuthFacade>(() => _i45.UserAuthFacade(),
      registerFor: {_set_locale_test_env});
  gh.lazySingleton<_i35.IUserAuthFacade>(() => _i46.UserAuthFacade(),
      registerFor: {_sign_up_test_env});
  gh.lazySingleton<_i47.IUserAuthRepository>(
      () => _i48.UserAuthRepositoryMock(),
      registerFor: {_get_authentication_providers_test_env});
  gh.lazySingleton<_i47.IUserAuthRepository>(
      () => _i49.UserAuthRepositoryMock(),
      registerFor: {_get_current_user_test_env});
  gh.lazySingleton<_i47.IUserAuthRepository>(
      () => _i50.UserAuthRepository(get<_i10.FirebaseAuthDataSource>()),
      registerFor: {_prod, _user_auth_repository_test_env});
  gh.lazySingleton<_i47.IUserAuthRepository>(
      () => _i51.UserAuthRepositoryMock(),
      registerFor: {_reload_user_test_env});
  gh.lazySingleton<_i52.LinkEmailProvider>(
      () => _i52.LinkEmailProvider(get<_i35.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _link_email_provider_test_env});
  gh.lazySingleton<_i53.LinkFacebookProvider>(
      () => _i53.LinkFacebookProvider(get<_i35.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _link_facebook_provider_test_env});
  gh.lazySingleton<_i49.OfflineGetCurrentUser>(
      () => _i49.OfflineGetCurrentUser(get<_i47.IUserAuthRepository>()),
      registerFor: {_get_current_user_test_env});
  gh.lazySingleton<_i49.OnlineGetCurrentUser>(
      () => _i49.OnlineGetCurrentUser(get<_i47.IUserAuthRepository>()),
      registerFor: {_get_current_user_test_env});
  gh.lazySingleton<_i54.PasswordReset>(
      () => _i54.PasswordReset(get<_i35.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _password_reset_test_env});
  gh.factory<_i55.PasswordResetBloc>(
      () => _i55.PasswordResetBloc(get<_i54.PasswordReset>(),
          get<_i5.ConnectivityBloc>(), get<_i6.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i56.PaymentService>(() => _i56.PaymentService(),
      registerFor: {_prod});
  gh.lazySingleton<_i56.PaymentService>(() => _i15.PaymentServiceMock(),
      registerFor: {_user_section_facade_test_env});
  gh.lazySingleton<_i57.PickImage>(() => _i57.PickImage(),
      registerFor: {_prod, _dev, _pick_image_test_env});
  gh.lazySingleton<_i58.PickVideo>(() => _i58.PickVideo(),
      registerFor: {_prod, _dev, _pick_video_test_env});
  gh.lazySingleton<_i59.ReloadUser>(
      () => _i59.ReloadUser(get<_i47.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _reload_user_test_env});
  gh.lazySingleton<_i60.SendEmailVerification>(
      () => _i60.SendEmailVerification(get<_i35.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _send_email_verification_test_env});
  gh.lazySingleton<_i61.SetLocale>(
      () => _i61.SetLocale(get<_i35.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _set_locale_test_env});
  gh.lazySingleton<_i62.SignOut>(
      () => _i62.SignOut(get<_i35.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _sign_out_test_env});
  gh.lazySingleton<_i63.SignUp>(() => _i63.SignUp(get<_i35.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _sign_up_test_env});
  gh.lazySingleton<_i64.TechniqueLocalDataSource>(
      () => _i16.TechniqueLocalDataSourceMock(),
      registerFor: {_technique_repository_test_env});
  gh.lazySingleton<_i64.TechniqueLocalDataSource>(
      () => _i64.TechniqueLocalDataSource(),
      registerFor: {_prod});
  gh.factory<_i65.ThumbnailPickerBloc>(
      () => _i65.ThumbnailPickerBloc(get<_i57.PickImage>()),
      registerFor: {_prod, _dev});
  gh.factory<_i66.ToggleSwitchBloc>(() => _i66.ToggleSwitchBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i67.UpdateCategory>(
      () => _i67.UpdateCategory(get<_i18.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev, _update_category_test_env});
  gh.lazySingleton<_i68.UpdateTechnique>(
      () => _i68.UpdateTechnique(get<_i28.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev, _update_technique_test_env});
  gh.factory<_i69.UserSectionNavigationBloc>(
      () => _i69.UserSectionNavigationBloc(),
      registerFor: {_prod, _dev});
  gh.factory<_i70.VideoPickerBloc>(
      () => _i70.VideoPickerBloc(get<_i58.PickVideo>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i71.AuthBloc>(
      () => _i71.AuthBloc(get<_i59.ReloadUser>(), get<_i62.SignOut>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i72.CreateCategory>(
      () => _i72.CreateCategory(get<_i18.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev, _create_category_test_env});
  gh.lazySingleton<_i73.CreateTechnique>(
      () => _i73.CreateTechnique(get<_i28.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev, _create_technique_test_env});
  gh.lazySingleton<_i74.EmailAuthentication>(
      () => _i74.EmailAuthentication(get<_i35.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _email_authentication_test_env});
  gh.factory<_i75.EmailFormBloc>(() => _i75.EmailFormBloc(
      get<_i74.EmailAuthentication>(),
      get<_i5.ConnectivityBloc>(),
      get<_i6.ErrorBloc>(),
      get<_i71.AuthBloc>()));
  gh.factory<_i76.EmailVerificationBloc>(
      () => _i76.EmailVerificationBloc(
          get<_i60.SendEmailVerification>(),
          get<_i5.ConnectivityBloc>(),
          get<_i59.ReloadUser>(),
          get<_i6.ErrorBloc>(),
          get<_i71.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i45.EnglishCzechSupportSetLocale>(
      () => _i45.EnglishCzechSupportSetLocale(get<_i35.IUserAuthFacade>()),
      registerFor: {_set_locale_test_env});
  gh.lazySingleton<_i77.FacebookAuthentication>(
      () => _i77.FacebookAuthentication(get<_i35.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _facebook_authentication_test_env});
  gh.lazySingleton<_i78.GetAllCategories>(
      () => _i78.GetAllCategories(get<_i18.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev, _get_all_categories_test_env});
  gh.lazySingleton<_i79.GetAllTechniques>(
      () => _i79.GetAllTechniques(get<_i28.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev, _get_all_techniques_test_env});
  gh.lazySingleton<_i80.GetAuthProviders>(
      () => _i80.GetAuthProviders(get<_i47.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _get_authentication_providers_test_env});
  gh.lazySingleton<_i81.GetCategories>(
      () => _i81.GetCategories(get<_i26.ICategoryRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i82.GetCategoryLocalizedData>(
      () => _i82.GetCategoryLocalizedData(get<_i18.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev, _get_category_localized_data_test_env});
  gh.lazySingleton<_i83.GetCurrentUser>(
      () => _i83.GetCurrentUser(get<_i47.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _get_current_user_test_env});
  gh.lazySingleton<_i84.GetHiddenCategories>(
      () => _i84.GetHiddenCategories(get<_i18.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev, _get_hidden_categories_test_env});
  gh.lazySingleton<_i85.GetTechniqueLocalizedData>(
      () =>
          _i85.GetTechniqueLocalizedData(get<_i28.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev, _get_technique_localized_data_test_env});
  gh.lazySingleton<_i86.GetTechniquesByCategory>(
      () => _i86.GetTechniquesByCategory(get<_i28.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev, _get_techniques_by_category_test_env});
  gh.lazySingleton<_i87.GetVisibleCategories>(
      () => _i87.GetVisibleCategories(get<_i18.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev, _get_visible_categories_test_env});
  gh.lazySingleton<_i88.GoogleAuthentication>(
      () => _i88.GoogleAuthentication(get<_i35.IUserAuthFacade>()),
      registerFor: {_prod, _dev, _google_authentication_test_env});
  gh.factory<_i89.HiddenCategoriesBloc>(
      () => _i89.HiddenCategoriesBloc(get<_i84.GetHiddenCategories>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i90.ITechniqueRepository>(
      () => _i91.TechniqueRepository(get<_i14.FirebaseUserSectionDataSource>(),
          get<_i64.TechniqueLocalDataSource>()),
      registerFor: {_prod, _technique_repository_test_env});
  gh.lazySingleton<_i92.IUserSectionFacade>(
      () => _i93.UserSectionFacade(get<_i56.PaymentService>(),
          get<_i14.FirebaseUserSectionDataSource>()),
      registerFor: {_prod, _user_section_facade_test_env});
  gh.factoryParam<_i94.LinkProvidersBloc, _i94.LinkProvidersState?, dynamic>(
      (initialState, _) => _i94.LinkProvidersBloc(
          initialState,
          get<_i77.FacebookAuthentication>(),
          get<_i88.GoogleAuthentication>(),
          get<_i74.EmailAuthentication>(),
          get<_i53.LinkFacebookProvider>(),
          get<_i52.LinkEmailProvider>(),
          get<_i62.SignOut>(),
          get<_i6.ErrorBloc>(),
          get<_i71.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i95.MarkTechniqueAsFavorite>(
      () => _i95.MarkTechniqueAsFavorite(get<_i92.IUserSectionFacade>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i96.PurchaseTechnique>(
      () => _i96.PurchaseTechnique(get<_i92.IUserSectionFacade>()),
      registerFor: {_prod, _dev});
  gh.factory<_i97.PurchaseTechniqueBloc>(
      () => _i97.PurchaseTechniqueBloc(
          get<_i96.PurchaseTechnique>(), get<_i6.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i98.RemoveTechniqueFromFavorites>(
      () => _i98.RemoveTechniqueFromFavorites(get<_i92.IUserSectionFacade>()),
      registerFor: {_prod, _dev});
  gh.factory<_i99.SignUpBloc>(
      () => _i99.SignUpBloc(
          get<_i63.SignUp>(),
          get<_i80.GetAuthProviders>(),
          get<_i5.ConnectivityBloc>(),
          get<_i6.ErrorBloc>(),
          get<_i71.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i100.SplashScreenBloc>(
      () => _i100.SplashScreenBloc(get<_i83.GetCurrentUser>(),
          get<_i61.SetLocale>(), get<_i71.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i101.TechniqueDetailBloc>(
      () => _i101.TechniqueDetailBloc(get<_i95.MarkTechniqueAsFavorite>(),
          get<_i98.RemoveTechniqueFromFavorites>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i102.TechniqueFormBloc, _i102.TechniqueFormState?, dynamic>(
      (initialState, _) => _i102.TechniqueFormBloc(
          initialState,
          get<_i78.GetAllCategories>(),
          get<_i73.CreateTechnique>(),
          get<_i68.UpdateTechnique>(),
          get<_i6.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i103.TechniqueListBloc>(
      () => _i103.TechniqueListBloc(get<_i79.GetAllTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i104.TechniqueLocalizationBloc>(
      () => _i104.TechniqueLocalizationBloc(
          get<_i85.GetTechniqueLocalizedData>()),
      registerFor: {_prod, _dev});
  gh.factory<_i105.ThirdPartyAuthBloc>(
      () => _i105.ThirdPartyAuthBloc(
          get<_i77.FacebookAuthentication>(),
          get<_i88.GoogleAuthentication>(),
          get<_i80.GetAuthProviders>(),
          get<_i71.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i106.VisibleCategoriesBloc>(
      () => _i106.VisibleCategoriesBloc(get<_i87.GetVisibleCategories>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i107.CategoriesBloc>(
      () => _i107.CategoriesBloc(get<_i81.GetCategories>()),
      registerFor: {_prod, _dev});
  gh.factory<_i108.CategoryDetailBloc>(
      () => _i108.CategoryDetailBloc(get<_i86.GetTechniquesByCategory>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i109.CategoryFormBloc, _i109.CategoryFormState?, dynamic>(
      (initialState, _) => _i109.CategoryFormBloc(
          initialState, get<_i72.CreateCategory>(), get<_i67.UpdateCategory>()),
      registerFor: {_prod, _dev});
  gh.factory<_i110.CategoryLocalizationBloc>(
      () =>
          _i110.CategoryLocalizationBloc(get<_i82.GetCategoryLocalizedData>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i111.DeleteDownloadedTechnique>(
      () => _i111.DeleteDownloadedTechnique(get<_i90.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i112.DownloadTechnique>(
      () => _i112.DownloadTechnique(get<_i90.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i113.GetDownloadedTechniques>(
      () => _i113.GetDownloadedTechniques(get<_i90.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i114.GetMostRecentTechniques>(
      () => _i114.GetMostRecentTechniques(get<_i90.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i115.GetTechniqueById>(
      () => _i115.GetTechniqueById(get<_i90.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i116.GetTechniques>(
      () => _i116.GetTechniques(get<_i90.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i117.GetTechniquesByCategory>(
      () => _i117.GetTechniquesByCategory(get<_i90.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i118.MostRecentTechniquesBloc>(
      () =>
          _i118.MostRecentTechniquesBloc(get<_i114.GetMostRecentTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i119.TechniqueBloc>(
      () => _i119.TechniqueBloc(get<_i115.GetTechniqueById>()),
      registerFor: {_prod, _dev});
  gh.factory<_i120.TechniqueLocalStorageBloc>(
      () => _i120.TechniqueLocalStorageBloc(
          get<_i112.DownloadTechnique>(),
          get<_i113.GetDownloadedTechniques>(),
          get<_i111.DeleteDownloadedTechnique>()),
      registerFor: {_prod, _dev});
  return get;
}
