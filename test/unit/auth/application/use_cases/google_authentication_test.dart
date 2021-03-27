import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/errors/wrong_email_or_password_error.dart';
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../dependency_injection/test_service_locator.dart';

void main() {
  testConfigureDependencies(GOOGLE_AUTHENTICATION_TEST_ENV);

  final uid = "0";
  final name = "John Doe";
  final email = "john.doe@gmail.com";
  final googleAuthentication = testServiceLocator<GoogleAuthentication>();

  test("[GoogleAuthentication] should return user data when user signs into google", () async {
    when(() => testServiceLocator<IUserAuthRepository>().getUserWithGoogle()).thenAnswer(
      (_) async => User(uid: uid, name: name, email: email),
    );

    final user = await googleAuthentication();

    expect(user.uid, uid);
    expect(user.name, name);
    expect(user.email, email);
  });

  test("[GoogleAuthentication] should throw [WrongEmailOrPasswordError] when user fails to log into google", () async {
    when(() => testServiceLocator<IUserAuthRepository>().getUserWithGoogle()).thenThrow(WrongEmailOrPasswordError());
    expect(() => googleAuthentication(), throwsA(isInstanceOf<WrongEmailOrPasswordError>()));
  });
}
