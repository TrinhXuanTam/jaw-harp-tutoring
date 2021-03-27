import 'package:injectable/injectable.dart' as Injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart';
import 'package:mocktail/mocktail.dart';

@Injectable.LazySingleton(as: IUserFacade, env: [
  EMAIL_AUTHENTICATION_TEST_ENV,
  GET_CURRENT_USER_TEST_ENV,
  SIGN_UP_TEST_ENV,
  EMAIL_VERIFICATION_CHECK_TEST_ENV,
  LINK_EMAIL_PROVIDER_TEST_ENV,
  LINK_FACEBOOK_PROVIDER_TEST_ENV,
  PASSWORD_RESET_TEST_ENV,
  SEND_EMAIL_VERIFICATION_TEST_ENV,
])
class IUserFacadeMock extends Mock implements IUserFacade {}

@Injectable.LazySingleton(as: IUserAuthRepository, env: [
  EMAIL_AUTHENTICATION_TEST_ENV,
  GET_CURRENT_USER_TEST_ENV,
  SIGN_UP_TEST_ENV,
  FACEBOOK_AUTHENTICATION_TEST_ENV,
  GOOGLE_AUTHENTICATION_TEST_ENV,
  GET_AUTHENTICATION_PROVIDERS_TEST_ENV,
])
class IUserRepositoryMock extends Mock implements IUserAuthRepository {}

@Injectable.LazySingleton(as: FirebaseAuthDataSource, env: [USER_REPOSITORY_TEST_ENV])
class FirebaseAuthDataSourceMock extends Mock implements FirebaseAuthDataSource {}
