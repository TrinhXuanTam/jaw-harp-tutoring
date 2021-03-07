import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/errors/user_not_signed_in_error.dart';
import 'package:jews_harp/features/auth/application/use_cases/link_facebook_provider.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../dependency_injection/test_service_locator.dart';

void main() {
  testConfigureDependencies(LINK_FACEBOOK_PROVIDER_TEST_ENV);

  final uid = "0";
  final name = "John Doe";
  final email = "john.doe@gmail.com";

  final linkFacebookProvider = testServiceLocator<LinkFacebookProvider>();

  test("[LinkFacebookProvider] should user data when account was linked to Facebook", () async {
    when(() => testServiceLocator<IUserFacade>().linkAccountToFacebook()).thenAnswer(
      (_) async => UserDTO(uid: uid, name: name, email: email),
    );

    final user = await linkFacebookProvider();

    expect(user.uid, uid);
    expect(user.name, name);
    expect(user.email, email);
  });

  test("[LinkFacebookProvider] should throw [UserNotSignedInError] when user is not signed in", () async {
    when(() => testServiceLocator<IUserFacade>().linkAccountToFacebook()).thenThrow(UserNotSignedInError());
    expect(() => linkFacebookProvider(), throwsA(isInstanceOf<UserNotSignedInError>()));
  });
}
