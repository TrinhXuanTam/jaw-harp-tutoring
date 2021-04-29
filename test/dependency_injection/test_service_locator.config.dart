// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jews_harp/core/BLoCs/errors/error_bloc.dart' as _i4;
import 'package:jews_harp/core/BLoCs/hide_field_input/hide_field_input_bloc.dart'
    as _i10;
import 'package:jews_harp/core/BLoCs/toggle_switch/toggle_switch_bloc.dart'
    as _i40;
import 'package:jews_harp/features/admin/application/use_cases/create_category.dart'
    as _i45;
import 'package:jews_harp/features/admin/application/use_cases/create_technique.dart'
    as _i46;
import 'package:jews_harp/features/admin/application/use_cases/get_all_categories.dart'
    as _i50;
import 'package:jews_harp/features/admin/application/use_cases/get_all_techniques.dart'
    as _i51;
import 'package:jews_harp/features/admin/application/use_cases/get_category_localized_data.dart'
    as _i54;
import 'package:jews_harp/features/admin/application/use_cases/get_hidden_categories.dart'
    as _i56;
import 'package:jews_harp/features/admin/application/use_cases/get_technique_localized_data.dart'
    as _i57;
import 'package:jews_harp/features/admin/application/use_cases/get_visible_categories.dart'
    as _i58;
import 'package:jews_harp/features/admin/application/use_cases/pick_image.dart'
    as _i30;
import 'package:jews_harp/features/admin/application/use_cases/pick_video.dart'
    as _i31;
import 'package:jews_harp/features/admin/application/use_cases/update_category.dart'
    as _i41;
import 'package:jews_harp/features/admin/application/use_cases/update_technique.dart'
    as _i42;
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart'
    as _i11;
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart'
    as _i17;
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart'
    as _i5;
import 'package:jews_harp/features/admin/infrastructure/repositories/category_admin_repository.dart'
    as _i12;
import 'package:jews_harp/features/admin/infrastructure/repositories/technique_admin_repository.dart'
    as _i18;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_detail/category_detail_bloc.dart'
    as _i86;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart'
    as _i70;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_localization/category_localization_bloc.dart'
    as _i71;
import 'package:jews_harp/features/admin/presentation/BLoCs/hidden_categories/hidden_categories_bloc.dart'
    as _i60;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_form/technique_form_bloc.dart'
    as _i63;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_list/technique_list_bloc.dart'
    as _i64;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_localization/technique_localization_bloc.dart'
    as _i65;
import 'package:jews_harp/features/admin/presentation/BLoCs/thumbnail_picker/thumbnail_picker_bloc.dart'
    as _i39;
import 'package:jews_harp/features/admin/presentation/BLoCs/video_picker/video_picker_bloc.dart'
    as _i44;
import 'package:jews_harp/features/admin/presentation/BLoCs/visible_categories/visible_categories_bloc.dart'
    as _i67;
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart'
    as _i47;
import 'package:jews_harp/features/auth/application/use_cases/email_verification_check.dart'
    as _i48;
import 'package:jews_harp/features/auth/application/use_cases/facebook_authentication.dart'
    as _i49;
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart'
    as _i52;
import 'package:jews_harp/features/auth/application/use_cases/get_current_user.dart'
    as _i55;
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart'
    as _i59;
import 'package:jews_harp/features/auth/application/use_cases/link_email_provider.dart'
    as _i25;
import 'package:jews_harp/features/auth/application/use_cases/link_facebook_provider.dart'
    as _i26;
import 'package:jews_harp/features/auth/application/use_cases/password_reset.dart'
    as _i28;
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart'
    as _i33;
import 'package:jews_harp/features/auth/application/use_cases/set_locale.dart'
    as _i34;
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart'
    as _i35;
import 'package:jews_harp/features/auth/application/use_cases/sign_up.dart'
    as _i36;
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart'
    as _i21;
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart'
    as _i19;
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart'
    as _i6;
import 'package:jews_harp/features/auth/infrastructure/external_services/firebase_auth.dart'
    as _i8;
import 'package:jews_harp/features/auth/infrastructure/facades/user_facade.dart'
    as _i22;
import 'package:jews_harp/features/auth/infrastructure/repositories/user_repository.dart'
    as _i20;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_authentication/email_auth_bloc.dart'
    as _i74;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_form_bloc.dart'
    as _i75;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart'
    as _i76;
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart'
    as _i68;
import 'package:jews_harp/features/auth/presentation/BLoCs/password_reset/password_reset_bloc.dart'
    as _i29;
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart'
    as _i83;
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart'
    as _i66;
import 'package:jews_harp/features/user_section/application/delete_downloaded_technique.dart'
    as _i72;
import 'package:jews_harp/features/user_section/application/download_technique.dart'
    as _i73;
import 'package:jews_harp/features/user_section/application/get_categories.dart'
    as _i53;
import 'package:jews_harp/features/user_section/application/get_downloaded_techniques.dart'
    as _i77;
import 'package:jews_harp/features/user_section/application/get_most_recent_techniques.dart'
    as _i78;
import 'package:jews_harp/features/user_section/application/get_technique_by_Id.dart'
    as _i79;
import 'package:jews_harp/features/user_section/application/get_techniques.dart'
    as _i80;
import 'package:jews_harp/features/user_section/application/get_techniques_by_category.dart'
    as _i81;
import 'package:jews_harp/features/user_section/application/mark_technique_as_favorite.dart'
    as _i27;
import 'package:jews_harp/features/user_section/application/remove_technique_from_favorites.dart'
    as _i32;
import 'package:jews_harp/features/user_section/domain/facade_interfaces/payment_facade.dart'
    as _i15;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/category_repository.dart'
    as _i13;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart'
    as _i61;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/user_repository.dart'
    as _i23;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/category_local_data_source.dart'
    as _i3;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart'
    as _i9;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/technique_local_data_source.dart'
    as _i38;
import 'package:jews_harp/features/user_section/infrastructure/facades/payment_facade.dart'
    as _i16;
import 'package:jews_harp/features/user_section/infrastructure/repositories/category_repository.dart'
    as _i14;
import 'package:jews_harp/features/user_section/infrastructure/repositories/technique_repository.dart'
    as _i62;
import 'package:jews_harp/features/user_section/infrastructure/repositories/user_repository.dart'
    as _i24;
import 'package:jews_harp/features/user_section/presentation/BLoCs/categories/categories_bloc.dart'
    as _i69;
import 'package:jews_harp/features/user_section/presentation/BLoCs/most_recent_techniques/most_recent_techniques_bloc.dart'
    as _i82;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique/technique_bloc.dart'
    as _i84;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_detail/technique_detail_bloc.dart'
    as _i37;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_local_storage/technique_local_storage_bloc.dart'
    as _i85;
import 'package:jews_harp/features/user_section/presentation/BLoCs/user_section_navigation/user_section_navigation_bloc.dart'
    as _i43;

import 'mock.dart' as _i7;

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
  gh.lazySingleton<_i4.ErrorBloc>(() => _i4.ErrorBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i5.FirebaseAdminDataSource>(
      () => _i5.FirebaseAdminDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i6.FirebaseAuthDataSource>(
      () => _i7.FirebaseAuthDataSourceMock(),
      registerFor: {_user_repository_test_env});
  gh.lazySingleton<_i6.FirebaseAuthDataSource>(
      () => _i6.FirebaseAuthDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i8.FirebaseAuthService>(() => _i8.FirebaseAuthService(),
      registerFor: {_prod});
  gh.lazySingleton<_i9.FirebaseUserSectionDataSource>(
      () => _i9.FirebaseUserSectionDataSource(),
      registerFor: {_prod});
  gh.factory<_i10.HideFieldInputBloc>(() => _i10.HideFieldInputBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i11.ICategoryAdminRepository>(
      () => _i12.CategoryAdminRepository(get<_i5.FirebaseAdminDataSource>(),
          get<_i9.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i13.ICategoryRepository>(
      () => _i14.CategoryRepository(get<_i9.FirebaseUserSectionDataSource>(),
          get<_i3.CategoryLocalDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i15.IPaymentFacade>(() => _i16.PaymentFacade(),
      registerFor: {_prod});
  gh.lazySingleton<_i17.ITechniqueAdminRepository>(
      () => _i18.TechniqueAdminRepository(get<_i5.FirebaseAdminDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i19.IUserAuthRepository>(
      () => _i20.UserAuthRepository(get<_i6.FirebaseAuthDataSource>()),
      registerFor: {_prod, _user_repository_test_env});
  gh.lazySingleton<_i19.IUserAuthRepository>(() => _i7.IUserRepositoryMock(),
      registerFor: {
        _email_authentication_test_env,
        _get_current_user_test_env,
        _sign_up_test_env,
        _facebook_authentication_test_env,
        _google_authentication_test_env,
        _get_authentication_providers_test_env
      });
  gh.lazySingleton<_i21.IUserFacade>(
      () => _i22.FirebaseAuthFacade(get<_i8.FirebaseAuthService>()),
      registerFor: {_prod});
  gh.lazySingleton<_i21.IUserFacade>(() => _i7.IUserFacadeMock(), registerFor: {
    _email_authentication_test_env,
    _get_current_user_test_env,
    _sign_up_test_env,
    _email_verification_check_test_env,
    _link_email_provider_test_env,
    _link_facebook_provider_test_env,
    _password_reset_test_env,
    _send_email_verification_test_env
  });
  gh.lazySingleton<_i23.IUserRepository>(
      () => _i24.UserRepository(get<_i9.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i25.LinkEmailProvider>(
      () => _i25.LinkEmailProvider(get<_i21.IUserFacade>()),
      registerFor: {_prod, _dev, _link_email_provider_test_env});
  gh.lazySingleton<_i26.LinkFacebookProvider>(
      () => _i26.LinkFacebookProvider(get<_i21.IUserFacade>()),
      registerFor: {_prod, _dev, _link_facebook_provider_test_env});
  gh.lazySingleton<_i27.MarkTechniqueAsFavorite>(
      () => _i27.MarkTechniqueAsFavorite(get<_i23.IUserRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i28.PasswordReset>(
      () => _i28.PasswordReset(get<_i21.IUserFacade>()),
      registerFor: {_prod, _dev, _password_reset_test_env});
  gh.factory<_i29.PasswordResetBloc>(
      () => _i29.PasswordResetBloc(
          get<_i28.PasswordReset>(), get<_i4.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i30.PickImage>(() => _i30.PickImage(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i31.PickVideo>(() => _i31.PickVideo(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i32.RemoveTechniqueFromFavorites>(
      () => _i32.RemoveTechniqueFromFavorites(get<_i23.IUserRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i33.SendEmailVerification>(
      () => _i33.SendEmailVerification(get<_i21.IUserFacade>()),
      registerFor: {_prod, _dev, _send_email_verification_test_env});
  gh.lazySingleton<_i34.SetLocale>(
      () => _i34.SetLocale(
          get<_i21.IUserFacade>(), get<_i19.IUserAuthRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i35.SignOut>(() => _i35.SignOut(get<_i21.IUserFacade>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i36.SignUp>(
      () => _i36.SignUp(get<_i19.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _sign_up_test_env});
  gh.factory<_i37.TechniqueDetailBloc>(
      () => _i37.TechniqueDetailBloc(get<_i27.MarkTechniqueAsFavorite>(),
          get<_i32.RemoveTechniqueFromFavorites>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i38.TechniqueLocalDataSource>(
      () => _i38.TechniqueLocalDataSource(),
      registerFor: {_prod});
  gh.factory<_i39.ThumbnailPickerBloc>(
      () => _i39.ThumbnailPickerBloc(get<_i30.PickImage>()),
      registerFor: {_prod, _dev});
  gh.factory<_i40.ToggleSwitchBloc>(() => _i40.ToggleSwitchBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i41.UpdateCategory>(
      () => _i41.UpdateCategory(get<_i11.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i42.UpdateTechnique>(
      () => _i42.UpdateTechnique(get<_i17.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i43.UserSectionNavigationBloc>(
      () => _i43.UserSectionNavigationBloc(),
      registerFor: {_prod, _dev});
  gh.factory<_i44.VideoPickerBloc>(
      () => _i44.VideoPickerBloc(get<_i31.PickVideo>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i45.CreateCategory>(
      () => _i45.CreateCategory(get<_i11.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i46.CreateTechnique>(
      () => _i46.CreateTechnique(get<_i17.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i47.EmailAuthentication>(
      () => _i47.EmailAuthentication(get<_i19.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _email_authentication_test_env});
  gh.lazySingleton<_i48.EmailIsVerified>(
      () => _i48.EmailIsVerified(get<_i21.IUserFacade>()),
      registerFor: {_prod, _dev, _email_verification_check_test_env});
  gh.lazySingleton<_i49.FacebookAuthentication>(
      () => _i49.FacebookAuthentication(get<_i19.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _facebook_authentication_test_env});
  gh.lazySingleton<_i50.GetAllCategories>(
      () => _i50.GetAllCategories(get<_i11.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i51.GetAllTechniques>(
      () => _i51.GetAllTechniques(get<_i17.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i52.GetAuthProviders>(
      () => _i52.GetAuthProviders(get<_i19.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _get_authentication_providers_test_env});
  gh.lazySingleton<_i53.GetCategories>(
      () => _i53.GetCategories(get<_i13.ICategoryRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i54.GetCategoryLocalizedData>(
      () => _i54.GetCategoryLocalizedData(get<_i11.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i55.GetCurrentUser>(
      () => _i55.GetCurrentUser(get<_i19.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _get_current_user_test_env});
  gh.lazySingleton<_i56.GetHiddenCategories>(
      () => _i56.GetHiddenCategories(get<_i11.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i57.GetTechniqueLocalizedData>(
      () =>
          _i57.GetTechniqueLocalizedData(get<_i17.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i58.GetVisibleCategories>(
      () => _i58.GetVisibleCategories(get<_i11.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i59.GoogleAuthentication>(
      () => _i59.GoogleAuthentication(get<_i19.IUserAuthRepository>()),
      registerFor: {_prod, _dev, _google_authentication_test_env});
  gh.factory<_i60.HiddenCategoriesBloc>(
      () => _i60.HiddenCategoriesBloc(get<_i56.GetHiddenCategories>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i61.ITechniqueRepository>(
      () => _i62.TechniqueRepository(get<_i9.FirebaseUserSectionDataSource>(),
          get<_i38.TechniqueLocalDataSource>()),
      registerFor: {_prod});
  gh.factoryParam<_i63.TechniqueFormBloc, _i63.TechniqueFormState?, dynamic>(
      (initialState, _) => _i63.TechniqueFormBloc(
          initialState,
          get<_i50.GetAllCategories>(),
          get<_i46.CreateTechnique>(),
          get<_i42.UpdateTechnique>(),
          get<_i4.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i64.TechniqueListBloc>(
      () => _i64.TechniqueListBloc(get<_i51.GetAllTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i65.TechniqueLocalizationBloc>(
      () =>
          _i65.TechniqueLocalizationBloc(get<_i57.GetTechniqueLocalizedData>()),
      registerFor: {_prod, _dev});
  gh.factory<_i66.ThirdPartyAuthBloc>(
      () => _i66.ThirdPartyAuthBloc(
          get<_i49.FacebookAuthentication>(),
          get<_i59.GoogleAuthentication>(),
          get<_i52.GetAuthProviders>(),
          get<_i26.LinkFacebookProvider>()),
      registerFor: {_prod, _dev});
  gh.factory<_i67.VisibleCategoriesBloc>(
      () => _i67.VisibleCategoriesBloc(get<_i58.GetVisibleCategories>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i68.AuthBloc>(
      () => _i68.AuthBloc(
          get<_i55.GetCurrentUser>(),
          get<_i48.EmailIsVerified>(),
          get<_i34.SetLocale>(),
          get<_i35.SignOut>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i69.CategoriesBloc>(
      () => _i69.CategoriesBloc(get<_i53.GetCategories>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i70.CategoryFormBloc, _i70.CategoryFormState?, dynamic>(
      (initialState, _) => _i70.CategoryFormBloc(
          initialState, get<_i45.CreateCategory>(), get<_i41.UpdateCategory>()),
      registerFor: {_prod, _dev});
  gh.factory<_i71.CategoryLocalizationBloc>(
      () => _i71.CategoryLocalizationBloc(get<_i54.GetCategoryLocalizedData>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i72.DeleteDownloadedTechnique>(
      () => _i72.DeleteDownloadedTechnique(get<_i61.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i73.DownloadTechnique>(
      () => _i73.DownloadTechnique(get<_i61.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i74.EmailAuthBloc>(
      () => _i74.EmailAuthBloc(
          get<_i47.EmailAuthentication>(), get<_i4.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i75.EmailFormBloc>(() => _i75.EmailFormBloc(
      get<_i47.EmailAuthentication>(),
      get<_i4.ErrorBloc>(),
      get<_i68.AuthBloc>()));
  gh.factory<_i76.EmailVerificationBloc>(
      () => _i76.EmailVerificationBloc(
          get<_i35.SignOut>(),
          get<_i33.SendEmailVerification>(),
          get<_i48.EmailIsVerified>(),
          get<_i4.ErrorBloc>(),
          get<_i68.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i77.GetDownloadedTechniques>(
      () => _i77.GetDownloadedTechniques(get<_i61.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i78.GetMostRecentTechniques>(
      () => _i78.GetMostRecentTechniques(get<_i61.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i79.GetTechniqueById>(
      () => _i79.GetTechniqueById(get<_i61.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i80.GetTechniques>(
      () => _i80.GetTechniques(get<_i61.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i81.GetTechniquesByCategory>(
      () => _i81.GetTechniquesByCategory(get<_i61.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i82.MostRecentTechniquesBloc>(
      () => _i82.MostRecentTechniquesBloc(get<_i78.GetMostRecentTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i83.SignUpBloc>(
      () => _i83.SignUpBloc(
          get<_i36.SignUp>(),
          get<_i52.GetAuthProviders>(),
          get<_i25.LinkEmailProvider>(),
          get<_i4.ErrorBloc>(),
          get<_i68.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i84.TechniqueBloc>(
      () => _i84.TechniqueBloc(get<_i79.GetTechniqueById>()),
      registerFor: {_prod, _dev});
  gh.factory<_i85.TechniqueLocalStorageBloc>(
      () => _i85.TechniqueLocalStorageBloc(
          get<_i73.DownloadTechnique>(),
          get<_i77.GetDownloadedTechniques>(),
          get<_i72.DeleteDownloadedTechnique>()),
      registerFor: {_prod, _dev});
  gh.factory<_i86.CategoryDetailBloc>(
      () => _i86.CategoryDetailBloc(get<_i81.GetTechniquesByCategory>()),
      registerFor: {_prod, _dev});
  return get;
}
