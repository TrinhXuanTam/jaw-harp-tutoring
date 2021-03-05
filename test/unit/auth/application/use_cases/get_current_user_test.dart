import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/errors/user_not_signed_in_error.dart';
import 'package:jews_harp/features/auth/application/use_cases/get_current_user.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:mockito/mockito.dart';
import 'package:optional/optional.dart';

import '../../../../dependency_injection/test_service_locator.dart';

void main() {
  testConfigureDependencies(GET_CURRENT_USER_TEST_ENV);

  final uid = "0";
  final name = "John Doe";
  final email = "john.doe@gmail.com";
  final getCurrentUser = testServiceLocator<GetCurrentUser>();

  test("[GetCurrentUser] should return user data when user is returned from local data source", () async {
    when(testServiceLocator<IUserFacade>().isVerified()).thenAnswer((_) async => true);

    when(testServiceLocator<IUserRepository>().getCurrentUser()).thenAnswer(
      (_) async => Optional.of(User(uid: uid, name: name, email: email)),
    );

    final user = await getCurrentUser();

    assert(user.email == email);
    assert(user.name == name);
    assert(user.uid == uid);
  });

  test("[GetCurrentUser] should throw [UserNotSignedInError] when user data is not found in local data source", () async {
    when(testServiceLocator<IUserRepository>().getCurrentUser()).thenAnswer(
      (_) async => Optional.empty(),
    );

    expect(() => getCurrentUser(), throwsA(isInstanceOf<UserNotSignedInError>()));
  });
}
