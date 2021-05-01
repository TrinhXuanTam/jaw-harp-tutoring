import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';

/// Set language for sending localized emails.
@LazySingleton(env: [Environment.prod, Environment.dev])
class SetLocale {
  final IUserFacade _userFacade;
  final IUserAuthRepository _userRepository;

  SetLocale(this._userFacade, this._userRepository);

  Future<void> call(String languageCode) async {
    _userFacade.setLocale(languageCode);
    _userRepository.setLocale(languageCode);
  }
}
