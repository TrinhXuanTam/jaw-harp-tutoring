import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/errors/user_not_signed_in_error.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:jews_harp/features/auth/domain/use_cases/offline_authentication.dart';
import 'package:mockito/mockito.dart';
import 'package:optional/optional.dart';

import '../../../../dependency_injection/mock.dart';
import '../../../../dependency_injection/test_service_locator.dart';

void main() {
  testConfigureDependencies(OFFLINE_AUTHENTICATION_TEST_ENV);

  final uid = "0";
  final name = "John Doe";
  final email = "john.doe@gmail.com";
  final password = "John123456";
  final offlineAuthentication = testServiceLocator<OfflineAuthentication>();

  test("[OfflineAuthentication] should return user data when user is returned from local data source", () async {
    final mock = UserMock(uid, name, email, password);

    when(mock.isVerified()).thenAnswer((_) async => true);

    when(testServiceLocator<IUserRepository>().getCurrentUser()).thenAnswer(
      (_) async => Optional.of(mock),
    );

    final user = await offlineAuthentication();

    assert(user.email == email);
    assert(user.name == name);
    assert(user.uid == uid);
  });

  test("[OfflineAuthentication] should throw [UserNotSignedInError] when user data is not found in local data source", () async {
    when(testServiceLocator<IUserRepository>().getCurrentUser()).thenAnswer(
      (_) async => Optional.empty(),
    );

    expect(() => offlineAuthentication(), throwsA(isInstanceOf<UserNotSignedInError>()));
  });
}
