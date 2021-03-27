import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/auth/application/use_cases/get_current_user.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../dependency_injection/test_service_locator.dart';

void main() {
  testConfigureDependencies(GET_CURRENT_USER_TEST_ENV);

  final uid = "0";
  final name = "John Doe";
  final email = "john.doe@gmail.com";
  final getCurrentUser = testServiceLocator<GetCurrentUser>();

  test("[GetCurrentUser] should return user data when user is returned from local data source", () async {
    when(() => testServiceLocator<IUserAuthRepository>().getCurrentUser()).thenAnswer(
      (_) async => User(uid: uid, name: name, email: email),
    );

    final user = await getCurrentUser();

    expect(user != null, true);
    expect(user!.email, email);
    expect(user.name, name);
    expect(user.uid, uid);
  });

  test("[GetCurrentUser] should return null when user data is not found in local data source", () async {
    when(() => testServiceLocator<IUserAuthRepository>().getCurrentUser()).thenAnswer(
      (_) async => null,
    );

    expect(await getCurrentUser(), null);
  });
}
