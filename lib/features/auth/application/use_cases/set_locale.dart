import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';

/// Set language for sending localized emails.
@LazySingleton(env: [Environment.prod, Environment.dev])
class SetLocale {
  final IUserAuthFacade _userAuthFacade;

  SetLocale(this._userAuthFacade);

  Future<void> call(String languageCode) async {
    _userAuthFacade.setLocale(languageCode);
  }
}
