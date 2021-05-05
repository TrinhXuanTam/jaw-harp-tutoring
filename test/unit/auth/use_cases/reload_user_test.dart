import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/auth/application/use_cases/reload_user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: IUserAuthRepository, env: [RELOAD_USER_TEST_ENV])
class UserAuthRepositoryMock extends Mock implements IUserAuthRepository {}

void main() {
  testConfigureDependencies(RELOAD_USER_TEST_ENV);

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

  test("[ReloadUser] should return new 'User' entity when user is signed in.", () async {
    final reloadUser = serviceLocator<ReloadUser>();
    final userAuthRepository = serviceLocator<IUserAuthRepository>();
    when(() => userAuthRepository.reloadUser()).thenAnswer((_) async => user);

    final res = await reloadUser();

    expect(res, user);
  });
}
