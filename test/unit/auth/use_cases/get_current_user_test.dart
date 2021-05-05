import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/auth/application/use_cases/get_current_user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: IUserAuthRepository, env: [GET_CURRENT_USER_TEST_ENV])
class UserAuthRepositoryMock extends Mock implements IUserAuthRepository {}

@injectable.LazySingleton(env: [GET_CURRENT_USER_TEST_ENV])
class OnlineGetCurrentUser extends GetCurrentUser {
  OnlineGetCurrentUser(IUserAuthRepository userRepository) : super(userRepository);

  @override
  Future<bool> get checkConnection async => true;
}

@injectable.LazySingleton(env: [GET_CURRENT_USER_TEST_ENV])
class OfflineGetCurrentUser extends GetCurrentUser {
  OfflineGetCurrentUser(IUserAuthRepository userRepository) : super(userRepository);

  @override
  Future<bool> get checkConnection async => false;
}

void main() {
  testConfigureDependencies(GET_CURRENT_USER_TEST_ENV);

  final uid = "0";
  final name = "John Doe";
  final email = "john.doe@gmail.com";
  final isVerified = true;

  final user = UserDTO(
    uid: uid,
    name: name,
    email: email,
    isVerified: isVerified,
  );

  // Reset mock objects before each test.
  setUp(() {
    final userAuthRepository = serviceLocator<IUserAuthRepository>();
    reset(userAuthRepository);
  });

  test("[GetCurrentUser] should return online user data when user is returned from remote data source", () async {
    final getCurrentUser = serviceLocator<OnlineGetCurrentUser>();
    final userAuthRepository = serviceLocator<IUserAuthRepository>();
    when(() => userAuthRepository.getCurrentUser(true)).thenAnswer((_) async => user);

    final res = await getCurrentUser();

    expect(res, user);
  });

  test("[GetCurrentUser] should return offline user data when user is returned from local data source", () async {
    final getCurrentUser = serviceLocator<OfflineGetCurrentUser>();
    final userAuthRepository = serviceLocator<IUserAuthRepository>();
    when(() => userAuthRepository.getCurrentUser(false)).thenAnswer((_) async => user);

    final res = await getCurrentUser();

    expect(res, user);
  });

  test("[GetCurrentUser] should return null when user data is not found in local data source", () async {
    final getCurrentUser = serviceLocator<OfflineGetCurrentUser>();
    final userAuthRepository = serviceLocator<IUserAuthRepository>();
    when(() => userAuthRepository.getCurrentUser(false)).thenAnswer((_) async => null);

    final res = await getCurrentUser();

    expect(res, null);
  });
}
