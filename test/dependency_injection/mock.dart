import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:jews_harp/features/auth/infrastructure/data/data_sources/interfaces/local/authentication_local.dart';
import 'package:jews_harp/features/auth/infrastructure/data/data_sources/interfaces/remote/authentication_remote.dart';
import 'package:jews_harp/features/auth/infrastructure/data/data_sources/interfaces/remote/third_party_authentication.dart';
import 'package:jews_harp/features/auth/infrastructure/data/models/user_model.dart';
import 'package:mockito/mockito.dart';
import 'package:injectable/injectable.dart' as Injectable;

// ignore: must_be_immutable
class UserMock extends Mock implements User {
  final String uid;
  final String name;
  final String email;
  final String password;

  UserMock(this.uid, this.name, this.email, this.password);
}

// ignore: must_be_immutable
class UserModelMock extends Mock implements UserModel {
  final String uid;
  final String name;
  final String email;
  final String password;

  UserModelMock(this.uid, this.name, this.email, this.password);
}

@Injectable.LazySingleton(as: IAuthenticationRemoteDataSource, env: [USER_REPOSITORY_TEST_ENV])
class IAuthenticationRemoteDataSourceMock extends Mock implements IAuthenticationRemoteDataSource {}

@Injectable.LazySingleton(as: IAuthenticationLocalDataSource, env: [USER_REPOSITORY_TEST_ENV])
class IAuthenticationLocalDataSourceMock extends Mock implements IAuthenticationLocalDataSource {}

@Injectable.LazySingleton(as: IThirdPartyAuthenticationDataSource, env: [USER_REPOSITORY_TEST_ENV])
class IThirdPartyAuthenticationDataSourceMock extends Mock implements IThirdPartyAuthenticationDataSource {}

@Injectable.LazySingleton(as: IUserRepository, env: [EMAIL_AUTHENTICATION_TEST_ENV, OFFLINE_AUTHENTICATION_TEST_ENV, SIGN_UP_TEST_ENV])
class IUserRepositoryMock extends Mock implements IUserRepository {}
