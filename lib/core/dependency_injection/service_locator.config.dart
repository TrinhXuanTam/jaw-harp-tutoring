// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jews_harp/core/BLoCs/errors/error_bloc.dart' as _i3;
import 'package:jews_harp/core/BLoCs/hide_field_input/hide_field_input_bloc.dart'
    as _i7;
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
import 'package:jews_harp/features/admin/application/use_cases/get_hidden_categories.dart'
    as _i47;
import 'package:jews_harp/features/admin/application/use_cases/get_visible_categories.dart'
    as _i51;
import 'package:jews_harp/features/admin/application/use_cases/pick_image.dart'
    as _i24;
import 'package:jews_harp/features/admin/application/use_cases/pick_video.dart'
    as _i25;
import 'package:jews_harp/features/admin/application/use_cases/update_category.dart'
    as _i33;
import 'package:jews_harp/features/admin/application/use_cases/update_technique.dart'
    as _i34;
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart'
    as _i8;
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart'
    as _i12;
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart'
    as _i4;
import 'package:jews_harp/features/admin/infrastructure/repositories/category_admin_repository.dart'
    as _i9;
import 'package:jews_harp/features/admin/infrastructure/repositories/technique_admin_repository.dart'
    as _i13;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_detail/category_detail_bloc.dart'
    as _i62;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart'
    as _i63;
import 'package:jews_harp/features/admin/presentation/BLoCs/hidden_categories/hidden_categories_bloc.dart'
    as _i53;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_form/technique_form_bloc.dart'
    as _i55;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_list/technique_list_bloc.dart'
    as _i56;
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
    as _i46;
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart'
    as _i52;
import 'package:jews_harp/features/auth/application/use_cases/link_email_provider.dart'
    as _i20;
import 'package:jews_harp/features/auth/application/use_cases/link_facebook_provider.dart'
    as _i21;
import 'package:jews_harp/features/auth/application/use_cases/password_reset.dart'
    as _i22;
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart'
    as _i26;
import 'package:jews_harp/features/auth/application/use_cases/set_locale.dart'
    as _i27;
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart'
    as _i28;
import 'package:jews_harp/features/auth/application/use_cases/sign_up.dart'
    as _i29;
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart'
    as _i16;
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart'
    as _i18;
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart'
    as _i5;
import 'package:jews_harp/features/auth/infrastructure/facades/user_facade.dart'
    as _i17;
import 'package:jews_harp/features/auth/infrastructure/repositories/user_repository.dart'
    as _i19;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_authentication/email_auth_bloc.dart'
    as _i64;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart'
    as _i65;
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart'
    as _i60;
import 'package:jews_harp/features/auth/presentation/BLoCs/password_reset/password_reset_bloc.dart'
    as _i23;
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart'
    as _i66;
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart'
    as _i58;
import 'package:jews_harp/features/user_section/application/get_categories.dart'
    as _i45;
import 'package:jews_harp/features/user_section/application/get_most_recent_techniques.dart'
    as _i48;
import 'package:jews_harp/features/user_section/application/get_techniques.dart'
    as _i49;
import 'package:jews_harp/features/user_section/application/get_techniques_by_category.dart'
    as _i50;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/category_repository.dart'
    as _i10;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart'
    as _i14;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart'
    as _i6;
import 'package:jews_harp/features/user_section/infrastructure/repositories/category_repository.dart'
    as _i11;
import 'package:jews_harp/features/user_section/infrastructure/repositories/technique_repository.dart'
    as _i15;
import 'package:jews_harp/features/user_section/presentation/BLoCs/categories/categories_bloc.dart'
    as _i61;
import 'package:jews_harp/features/user_section/presentation/BLoCs/new_techniques/new_techniques_bloc.dart'
    as _i54;
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_detail/technique_detail_bloc.dart'
    as _i30;
import 'package:jews_harp/features/user_section/presentation/BLoCs/techniques/techniques_bloc.dart'
    as _i57;
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
  gh.lazySingleton<_i3.ErrorBloc>(() => _i3.ErrorBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i4.FirebaseAdminDataSource>(
      () => _i4.FirebaseAdminDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i5.FirebaseAuthDataSource>(
      () => _i5.FirebaseAuthDataSource(),
      registerFor: {_prod});
  gh.lazySingleton<_i6.FirebaseUserSectionDataSource>(
      () => _i6.FirebaseUserSectionDataSource(),
      registerFor: {_prod});
  gh.factory<_i7.HideFieldInputBloc>(() => _i7.HideFieldInputBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i8.ICategoryAdminRepository>(
      () => _i9.CategoryAdminRepository(get<_i4.FirebaseAdminDataSource>(),
          get<_i6.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i10.ICategoryRepository>(
      () => _i11.CategoryRepository(get<_i6.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i12.ITechniqueAdminRepository>(
      () => _i13.TechniqueAdminRepository(get<_i4.FirebaseAdminDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i14.ITechniqueRepository>(
      () => _i15.TechniqueRepository(get<_i6.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i16.IUserFacade>(() => _i17.FirebaseAuthFacade(),
      registerFor: {_prod});
  gh.lazySingleton<_i18.IUserRepository>(
      () => _i19.UserRepository(get<_i5.FirebaseAuthDataSource>()),
      registerFor: {_prod, _user_repository_test_env});
  gh.lazySingleton<_i20.LinkEmailProvider>(
      () => _i20.LinkEmailProvider(get<_i16.IUserFacade>()),
      registerFor: {_prod, _dev, _link_email_provider_test_env});
  gh.lazySingleton<_i21.LinkFacebookProvider>(
      () => _i21.LinkFacebookProvider(get<_i16.IUserFacade>()),
      registerFor: {_prod, _dev, _link_facebook_provider_test_env});
  gh.lazySingleton<_i22.PasswordReset>(
      () => _i22.PasswordReset(get<_i16.IUserFacade>()),
      registerFor: {_prod, _dev, _password_reset_test_env});
  gh.factory<_i23.PasswordResetBloc>(
      () => _i23.PasswordResetBloc(
          get<_i22.PasswordReset>(), get<_i3.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i24.PickImage>(() => _i24.PickImage(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i25.PickVideo>(() => _i25.PickVideo(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i26.SendEmailVerification>(
      () => _i26.SendEmailVerification(get<_i16.IUserFacade>()),
      registerFor: {_prod, _dev, _send_email_verification_test_env});
  gh.lazySingleton<_i27.SetLocale>(
      () =>
          _i27.SetLocale(get<_i16.IUserFacade>(), get<_i18.IUserRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i28.SignOut>(() => _i28.SignOut(get<_i16.IUserFacade>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i29.SignUp>(() => _i29.SignUp(get<_i18.IUserRepository>()),
      registerFor: {_prod, _dev, _sign_up_test_env});
  gh.factory<_i30.TechniqueDetailBloc>(() => _i30.TechniqueDetailBloc(),
      registerFor: {_prod, _dev});
  gh.factory<_i31.ThumbnailPickerBloc>(
      () => _i31.ThumbnailPickerBloc(get<_i24.PickImage>()),
      registerFor: {_prod, _dev});
  gh.factory<_i32.ToggleSwitchBloc>(() => _i32.ToggleSwitchBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i33.UpdateCategory>(
      () => _i33.UpdateCategory(get<_i8.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i34.UpdateTechnique>(
      () => _i34.UpdateTechnique(get<_i12.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i35.UserSectionNavigationBloc>(
      () => _i35.UserSectionNavigationBloc(),
      registerFor: {_prod, _dev});
  gh.factory<_i36.VideoPickerBloc>(
      () => _i36.VideoPickerBloc(get<_i25.PickVideo>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i37.CreateCategory>(
      () => _i37.CreateCategory(get<_i8.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i38.CreateTechnique>(
      () => _i38.CreateTechnique(get<_i12.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i39.EmailAuthentication>(
      () => _i39.EmailAuthentication(get<_i18.IUserRepository>()),
      registerFor: {_prod, _dev, _email_authentication_test_env});
  gh.lazySingleton<_i40.EmailIsVerified>(
      () => _i40.EmailIsVerified(get<_i16.IUserFacade>()),
      registerFor: {_prod, _dev, _email_verification_check_test_env});
  gh.lazySingleton<_i41.FacebookAuthentication>(
      () => _i41.FacebookAuthentication(get<_i18.IUserRepository>()),
      registerFor: {_prod, _dev, _facebook_authentication_test_env});
  gh.lazySingleton<_i42.GetAllCategories>(
      () => _i42.GetAllCategories(get<_i8.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i43.GetAllTechniques>(
      () => _i43.GetAllTechniques(get<_i12.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i44.GetAuthProviders>(
      () => _i44.GetAuthProviders(get<_i18.IUserRepository>()),
      registerFor: {_prod, _dev, _get_authentication_providers_test_env});
  gh.lazySingleton<_i45.GetCategories>(
      () => _i45.GetCategories(get<_i10.ICategoryRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i46.GetCurrentUser>(
      () => _i46.GetCurrentUser(get<_i18.IUserRepository>()),
      registerFor: {_prod, _dev, _get_current_user_test_env});
  gh.lazySingleton<_i47.GetHiddenCategories>(
      () => _i47.GetHiddenCategories(get<_i8.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i48.GetMostRecentTechniques>(
      () => _i48.GetMostRecentTechniques(get<_i14.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i49.GetTechniques>(
      () => _i49.GetTechniques(get<_i14.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i50.GetTechniquesByCategory>(
      () => _i50.GetTechniquesByCategory(get<_i14.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i51.GetVisibleCategories>(
      () => _i51.GetVisibleCategories(get<_i8.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i52.GoogleAuthentication>(
      () => _i52.GoogleAuthentication(get<_i18.IUserRepository>()),
      registerFor: {_prod, _dev, _google_authentication_test_env});
  gh.factory<_i53.HiddenCategoriesBloc>(
      () => _i53.HiddenCategoriesBloc(get<_i47.GetHiddenCategories>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i54.NewTechniquesBloc>(
      () => _i54.NewTechniquesBloc(get<_i48.GetMostRecentTechniques>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i55.TechniqueFormBloc, _i55.TechniqueFormState?, dynamic>(
      (initialState, _) => _i55.TechniqueFormBloc(
          initialState,
          get<_i42.GetAllCategories>(),
          get<_i38.CreateTechnique>(),
          get<_i34.UpdateTechnique>(),
          get<_i3.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i56.TechniqueListBloc>(
      () => _i56.TechniqueListBloc(get<_i43.GetAllTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i57.TechniquesBloc>(
      () => _i57.TechniquesBloc(
          get<_i50.GetTechniquesByCategory>(), get<_i49.GetTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i58.ThirdPartyAuthBloc>(
      () => _i58.ThirdPartyAuthBloc(
          get<_i41.FacebookAuthentication>(),
          get<_i52.GoogleAuthentication>(),
          get<_i44.GetAuthProviders>(),
          get<_i21.LinkFacebookProvider>()),
      registerFor: {_prod, _dev});
  gh.factory<_i59.VisibleCategoriesBloc>(
      () => _i59.VisibleCategoriesBloc(get<_i51.GetVisibleCategories>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i60.AuthBloc>(
      () => _i60.AuthBloc(
          get<_i46.GetCurrentUser>(),
          get<_i40.EmailIsVerified>(),
          get<_i27.SetLocale>(),
          get<_i28.SignOut>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i61.CategoriesBloc>(
      () => _i61.CategoriesBloc(get<_i45.GetCategories>()),
      registerFor: {_prod, _dev});
  gh.factory<_i62.CategoryDetailBloc>(
      () => _i62.CategoryDetailBloc(get<_i50.GetTechniquesByCategory>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i63.CategoryFormBloc, _i63.CategoryFormState?, dynamic>(
      (initialState, _) => _i63.CategoryFormBloc(
          initialState, get<_i37.CreateCategory>(), get<_i33.UpdateCategory>()),
      registerFor: {_prod, _dev});
  gh.factory<_i64.EmailAuthBloc>(
      () => _i64.EmailAuthBloc(
          get<_i39.EmailAuthentication>(), get<_i3.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i65.EmailVerificationBloc>(
      () => _i65.EmailVerificationBloc(
          get<_i28.SignOut>(),
          get<_i26.SendEmailVerification>(),
          get<_i40.EmailIsVerified>(),
          get<_i3.ErrorBloc>(),
          get<_i60.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i66.SignUpBloc>(
      () => _i66.SignUpBloc(
          get<_i29.SignUp>(),
          get<_i44.GetAuthProviders>(),
          get<_i20.LinkEmailProvider>(),
          get<_i3.ErrorBloc>(),
          get<_i60.AuthBloc>()),
      registerFor: {_prod, _dev});
  return get;
}
