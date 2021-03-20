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
    as _i36;
import 'package:jews_harp/features/admin/application/use_cases/create_technique.dart'
    as _i37;
import 'package:jews_harp/features/admin/application/use_cases/get_all_categories.dart'
    as _i41;
import 'package:jews_harp/features/admin/application/use_cases/get_all_techniques.dart'
    as _i42;
import 'package:jews_harp/features/admin/application/use_cases/get_hidden_categories.dart'
    as _i46;
import 'package:jews_harp/features/admin/application/use_cases/get_techniques_by_category.dart'
    as _i48;
import 'package:jews_harp/features/admin/application/use_cases/get_visible_categories.dart'
    as _i49;
import 'package:jews_harp/features/admin/application/use_cases/pick_image.dart'
    as _i25;
import 'package:jews_harp/features/admin/application/use_cases/pick_video.dart'
    as _i26;
import 'package:jews_harp/features/admin/application/use_cases/update_category.dart'
    as _i33;
import 'package:jews_harp/features/admin/application/use_cases/update_technique.dart'
    as _i34;
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart'
    as _i9;
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart'
    as _i13;
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart'
    as _i4;
import 'package:jews_harp/features/admin/infrastructure/repositories/category_admin_repository.dart'
    as _i10;
import 'package:jews_harp/features/admin/infrastructure/repositories/technique_admin_repository.dart'
    as _i14;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_detail/category_detail_bloc.dart'
    as _i59;
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart'
    as _i60;
import 'package:jews_harp/features/admin/presentation/BLoCs/hidden_categories/hidden_categories_bloc.dart'
    as _i51;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_form/technique_form_bloc.dart'
    as _i53;
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_list/technique_list_bloc.dart'
    as _i54;
import 'package:jews_harp/features/admin/presentation/BLoCs/thumbnail_picker/thumbnail_picker_bloc.dart'
    as _i31;
import 'package:jews_harp/features/admin/presentation/BLoCs/video_picker/video_picker_bloc.dart'
    as _i35;
import 'package:jews_harp/features/admin/presentation/BLoCs/visible_categories/visible_categories_bloc.dart'
    as _i56;
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart'
    as _i38;
import 'package:jews_harp/features/auth/application/use_cases/email_verification_check.dart'
    as _i39;
import 'package:jews_harp/features/auth/application/use_cases/facebook_authentication.dart'
    as _i40;
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart'
    as _i43;
import 'package:jews_harp/features/auth/application/use_cases/get_current_user.dart'
    as _i45;
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart'
    as _i50;
import 'package:jews_harp/features/auth/application/use_cases/link_email_provider.dart'
    as _i21;
import 'package:jews_harp/features/auth/application/use_cases/link_facebook_provider.dart'
    as _i22;
import 'package:jews_harp/features/auth/application/use_cases/password_reset.dart'
    as _i23;
import 'package:jews_harp/features/auth/application/use_cases/send_email_verification.dart'
    as _i27;
import 'package:jews_harp/features/auth/application/use_cases/set_locale.dart'
    as _i28;
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart'
    as _i29;
import 'package:jews_harp/features/auth/application/use_cases/sign_up.dart'
    as _i30;
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart'
    as _i17;
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart'
    as _i19;
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart'
    as _i5;
import 'package:jews_harp/features/auth/infrastructure/facades/user_facade.dart'
    as _i18;
import 'package:jews_harp/features/auth/infrastructure/repositories/user_repository.dart'
    as _i20;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_authentication/email_auth_bloc.dart'
    as _i61;
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart'
    as _i62;
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart'
    as _i57;
import 'package:jews_harp/features/auth/presentation/BLoCs/password_reset/password_reset_bloc.dart'
    as _i24;
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart'
    as _i63;
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart'
    as _i55;
import 'package:jews_harp/features/user_section/application/get_categories.dart'
    as _i44;
import 'package:jews_harp/features/user_section/application/get_most_recent_techniques.dart'
    as _i47;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/category_repository.dart'
    as _i11;
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart'
    as _i15;
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart'
    as _i6;
import 'package:jews_harp/features/user_section/infrastructure/repositories/category_repository.dart'
    as _i12;
import 'package:jews_harp/features/user_section/infrastructure/repositories/technique_repository.dart'
    as _i16;
import 'package:jews_harp/features/user_section/presentation/BLoCs/categories/categories_bloc.dart'
    as _i58;
import 'package:jews_harp/features/user_section/presentation/BLoCs/home_screen/home_screen_bloc.dart'
    as _i8;
import 'package:jews_harp/features/user_section/presentation/BLoCs/new_techniques/new_techniques_bloc.dart'
    as _i52;

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
  gh.factory<_i8.HomeScreenBloc>(() => _i8.HomeScreenBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i9.ICategoryAdminRepository>(
      () => _i10.CategoryAdminRepository(get<_i4.FirebaseAdminDataSource>(),
          get<_i6.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i11.ICategoryRepository>(
      () => _i12.CategoryRepository(get<_i6.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i13.ITechniqueAdminRepository>(
      () => _i14.TechniqueAdminRepository(get<_i4.FirebaseAdminDataSource>(),
          get<_i6.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i15.ITechniqueRepository>(
      () => _i16.TechniqueRepository(get<_i6.FirebaseUserSectionDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<_i17.IUserFacade>(() => _i18.FirebaseAuthFacade(),
      registerFor: {_prod});
  gh.lazySingleton<_i19.IUserRepository>(
      () => _i20.UserRepository(get<_i5.FirebaseAuthDataSource>()),
      registerFor: {_prod, _user_repository_test_env});
  gh.lazySingleton<_i21.LinkEmailProvider>(
      () => _i21.LinkEmailProvider(get<_i17.IUserFacade>()),
      registerFor: {_prod, _dev, _link_email_provider_test_env});
  gh.lazySingleton<_i22.LinkFacebookProvider>(
      () => _i22.LinkFacebookProvider(get<_i17.IUserFacade>()),
      registerFor: {_prod, _dev, _link_facebook_provider_test_env});
  gh.lazySingleton<_i23.PasswordReset>(
      () => _i23.PasswordReset(get<_i17.IUserFacade>()),
      registerFor: {_prod, _dev, _password_reset_test_env});
  gh.factory<_i24.PasswordResetBloc>(
      () => _i24.PasswordResetBloc(
          get<_i23.PasswordReset>(), get<_i3.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i25.PickImage>(() => _i25.PickImage(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i26.PickVideo>(() => _i26.PickVideo(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i27.SendEmailVerification>(
      () => _i27.SendEmailVerification(get<_i17.IUserFacade>()),
      registerFor: {_prod, _dev, _send_email_verification_test_env});
  gh.lazySingleton<_i28.SetLocale>(
      () =>
          _i28.SetLocale(get<_i17.IUserFacade>(), get<_i19.IUserRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i29.SignOut>(() => _i29.SignOut(get<_i17.IUserFacade>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i30.SignUp>(() => _i30.SignUp(get<_i19.IUserRepository>()),
      registerFor: {_prod, _dev, _sign_up_test_env});
  gh.factory<_i31.ThumbnailPickerBloc>(
      () => _i31.ThumbnailPickerBloc(get<_i25.PickImage>()),
      registerFor: {_prod, _dev});
  gh.factory<_i32.ToggleSwitchBloc>(() => _i32.ToggleSwitchBloc(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i33.UpdateCategory>(
      () => _i33.UpdateCategory(get<_i9.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i34.UpdateTechnique>(
      () => _i34.UpdateTechnique(get<_i13.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i35.VideoPickerBloc>(
      () => _i35.VideoPickerBloc(get<_i26.PickVideo>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i36.CreateCategory>(
      () => _i36.CreateCategory(get<_i9.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i37.CreateTechnique>(
      () => _i37.CreateTechnique(get<_i13.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i38.EmailAuthentication>(
      () => _i38.EmailAuthentication(get<_i19.IUserRepository>()),
      registerFor: {_prod, _dev, _email_authentication_test_env});
  gh.lazySingleton<_i39.EmailIsVerified>(
      () => _i39.EmailIsVerified(get<_i17.IUserFacade>()),
      registerFor: {_prod, _dev, _email_verification_check_test_env});
  gh.lazySingleton<_i40.FacebookAuthentication>(
      () => _i40.FacebookAuthentication(get<_i19.IUserRepository>()),
      registerFor: {_prod, _dev, _facebook_authentication_test_env});
  gh.lazySingleton<_i41.GetAllCategories>(
      () => _i41.GetAllCategories(get<_i9.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i42.GetAllTechniques>(
      () => _i42.GetAllTechniques(get<_i13.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i43.GetAuthProviders>(
      () => _i43.GetAuthProviders(get<_i19.IUserRepository>()),
      registerFor: {_prod, _dev, _get_authentication_providers_test_env});
  gh.lazySingleton<_i44.GetCategories>(
      () => _i44.GetCategories(get<_i11.ICategoryRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i45.GetCurrentUser>(
      () => _i45.GetCurrentUser(get<_i19.IUserRepository>()),
      registerFor: {_prod, _dev, _get_current_user_test_env});
  gh.lazySingleton<_i46.GetHiddenCategories>(
      () => _i46.GetHiddenCategories(get<_i9.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i47.GetMostRecentTechniques>(
      () => _i47.GetMostRecentTechniques(get<_i15.ITechniqueRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i48.GetTechniquesByCategory>(
      () => _i48.GetTechniquesByCategory(get<_i13.ITechniqueAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i49.GetVisibleCategories>(
      () => _i49.GetVisibleCategories(get<_i9.ICategoryAdminRepository>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i50.GoogleAuthentication>(
      () => _i50.GoogleAuthentication(get<_i19.IUserRepository>()),
      registerFor: {_prod, _dev, _google_authentication_test_env});
  gh.factory<_i51.HiddenCategoriesBloc>(
      () => _i51.HiddenCategoriesBloc(get<_i46.GetHiddenCategories>()),
      registerFor: {_prod, _dev});
  gh.factory<_i52.NewTechniquesBloc>(
      () => _i52.NewTechniquesBloc(get<_i47.GetMostRecentTechniques>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i53.TechniqueFormBloc, _i53.TechniqueFormState?, dynamic>(
      (initialState, _) => _i53.TechniqueFormBloc(
          initialState,
          get<_i41.GetAllCategories>(),
          get<_i37.CreateTechnique>(),
          get<_i34.UpdateTechnique>(),
          get<_i3.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i54.TechniqueListBloc>(
      () => _i54.TechniqueListBloc(get<_i42.GetAllTechniques>()),
      registerFor: {_prod, _dev});
  gh.factory<_i55.ThirdPartyAuthBloc>(
      () => _i55.ThirdPartyAuthBloc(
          get<_i40.FacebookAuthentication>(),
          get<_i50.GoogleAuthentication>(),
          get<_i43.GetAuthProviders>(),
          get<_i22.LinkFacebookProvider>()),
      registerFor: {_prod, _dev});
  gh.factory<_i56.VisibleCategoriesBloc>(
      () => _i56.VisibleCategoriesBloc(get<_i49.GetVisibleCategories>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i57.AuthBloc>(
      () => _i57.AuthBloc(
          get<_i45.GetCurrentUser>(),
          get<_i39.EmailIsVerified>(),
          get<_i28.SetLocale>(),
          get<_i29.SignOut>()),
      registerFor: {_prod, _dev});
  gh.factory<_i58.CategoriesBloc>(
      () => _i58.CategoriesBloc(get<_i44.GetCategories>()),
      registerFor: {_prod, _dev});
  gh.factory<_i59.CategoryDetailBloc>(
      () => _i59.CategoryDetailBloc(get<_i48.GetTechniquesByCategory>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i60.CategoryFormBloc, _i60.CategoryFormState?, dynamic>(
      (initialState, _) => _i60.CategoryFormBloc(
          initialState, get<_i36.CreateCategory>(), get<_i33.UpdateCategory>()),
      registerFor: {_prod, _dev});
  gh.factory<_i61.EmailAuthBloc>(
      () => _i61.EmailAuthBloc(
          get<_i38.EmailAuthentication>(), get<_i3.ErrorBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i62.EmailVerificationBloc>(
      () => _i62.EmailVerificationBloc(
          get<_i29.SignOut>(),
          get<_i27.SendEmailVerification>(),
          get<_i39.EmailIsVerified>(),
          get<_i3.ErrorBloc>(),
          get<_i57.AuthBloc>()),
      registerFor: {_prod, _dev});
  gh.factory<_i63.SignUpBloc>(
      () => _i63.SignUpBloc(
          get<_i30.SignUp>(),
          get<_i43.GetAuthProviders>(),
          get<_i21.LinkEmailProvider>(),
          get<_i3.ErrorBloc>(),
          get<_i57.AuthBloc>()),
      registerFor: {_prod, _dev});
  return get;
}
