import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/language_codes.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';

/// Set language for sending localized emails.
@LazySingleton(env: [Environment.prod, Environment.dev, SET_LOCALE_TEST_ENV])
class SetLocale {
  final IUserAuthFacade _userAuthFacade;

  SetLocale(this._userAuthFacade);

  /// Get a set of supported languages.
  Set<String> get supportedLanguages {
    return SupportedLanguages.getCodes().toSet();
  }

  Future<void> call(String languageCode) async {
    if (!supportedLanguages.contains(languageCode))
      _userAuthFacade.setLocale(ENGLISH_CODE);
    else
      _userAuthFacade.setLocale(languageCode);
  }
}
