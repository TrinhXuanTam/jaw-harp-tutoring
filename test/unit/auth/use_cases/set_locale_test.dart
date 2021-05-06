import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/language_codes.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/auth/application/use_cases/set_locale.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: IUserAuthFacade, env: [SET_LOCALE_TEST_ENV])
class UserAuthFacade extends Mock implements IUserAuthFacade {}

@injectable.LazySingleton(env: [SET_LOCALE_TEST_ENV])
class EnglishCzechSupportSetLocale extends SetLocale {
  EnglishCzechSupportSetLocale(IUserAuthFacade userAuthFacade) : super(userAuthFacade);

  @override
  Set<String> get supportedLanguages {
    return {
      ENGLISH_CODE,
      CZECH_CODE,
    };
  }
}

void main() {
  testConfigureDependencies(SET_LOCALE_TEST_ENV);

  // Reset mock objects before each test.
  setUp(() {
    final userAuthFacade = serviceLocator<IUserAuthFacade>();
    reset(userAuthFacade);
  });

  test("[SetLocale] should set locale when language is supported", () async {
    var currentLocale = ENGLISH_CODE;
    final newLocale = CZECH_CODE;
    final setLocale = serviceLocator<EnglishCzechSupportSetLocale>();
    final userAuthFacade = serviceLocator<IUserAuthFacade>();
    when(() => userAuthFacade.setLocale(newLocale)).thenAnswer((_) async => currentLocale = newLocale);

    await setLocale(newLocale);

    expect(currentLocale, newLocale);
  });

  test("[SetLocale] should set locale to english if language is not supported", () async {
    var currentLocale = CZECH_CODE;
    final newLocale = "NON-EXISTENT";
    final setLocale = serviceLocator<EnglishCzechSupportSetLocale>();
    final userAuthFacade = serviceLocator<IUserAuthFacade>();
    when(() => userAuthFacade.setLocale(ENGLISH_CODE)).thenAnswer((_) async => currentLocale = ENGLISH_CODE);

    await setLocale(newLocale);

    expect(currentLocale, ENGLISH_CODE);
  });
}
