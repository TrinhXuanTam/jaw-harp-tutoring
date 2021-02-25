import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:jews_harp/features/auth/infrastructure/data_sources/firebase_auth_data_source.dart';
import 'package:mockito/mockito.dart';
import 'package:injectable/injectable.dart' as Injectable;

@Injectable.LazySingleton(as: IUserFacade, env: [EMAIL_AUTHENTICATION_TEST_ENV, OFFLINE_AUTHENTICATION_TEST_ENV, SIGN_UP_TEST_ENV])
class IUserFacadeMock extends Mock implements IUserFacade {}

@Injectable.LazySingleton(as: IUserRepository, env: [EMAIL_AUTHENTICATION_TEST_ENV, OFFLINE_AUTHENTICATION_TEST_ENV, SIGN_UP_TEST_ENV])
class IUserRepositoryMock extends Mock implements IUserRepository {}

@Injectable.LazySingleton(as: FirebaseAuthDataSource, env: [USER_REPOSITORY_TEST_ENV])
class FirebaseAuthDataSourceMock extends Mock implements FirebaseAuthDataSource {}