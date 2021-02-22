import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/core/constants.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:jews_harp/features/auth/domain/use_cases/offline_authentication.dart';
import 'package:mockito/mockito.dart';
import 'package:optional/optional.dart';

import '../../../../dependency_injection/mock.dart';
import '../../../../dependency_injection/test_service_locator.dart';

void main() {
  testConfigureDependencies(OFFLINE_AUTHENTICATION_TEST_ENV);

  test("[OfflineAuthentication] should return user data when user is returned from local data source", () async {
    final uid = "0";
    final name = "John Doe";
    final email = "john.doe@gmail.com";
    final password = "John123456";

    when(testServiceLocator<IUserRepository>().getCurrentUser()).thenAnswer(
      (_) async => Optional.of(UserMock(uid, name, email, password)),
    );

    final offlineAuthentication = testServiceLocator<OfflineAuthentication>();
    final user = await offlineAuthentication();

    assert(user.isPresent);

    final userData = user.value;

    assert(userData.email == email);
    assert(userData.name == name);
    assert(userData.uid == uid);
  });

  test("[OfflineAuthentication] should return 'Optional.empty()' when user data is not found in local data source", () async {
    when(testServiceLocator<IUserRepository>().getCurrentUser()).thenAnswer(
      (_) async => Optional.empty(),
    );

    final offlineAuthentication = testServiceLocator<OfflineAuthentication>();
    final user = await offlineAuthentication();

    assert(user.isEmpty);
  });
}
