import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';
import 'package:jews_harp/features/auth/infrastructure/external_services/firebase_auth.dart';

@LazySingleton(as: IUserFacade, env: [Environment.prod])
class FirebaseAuthFacade extends IUserFacade {
  final FirebaseAuthService _authService;

  FirebaseAuthFacade(this._authService);

  @override
  Future<bool> resetPassword(String email) => _authService.resetPassword(email);

  @override
  Future<void> signOut() => _authService.signOut();

  @override
  Future<bool> isVerified() => _authService.isVerified();

  @override
  Future<void> sendVerificationEmail() => _authService.sendVerificationEmail();

  @override
  Future<UserDTO> linkAccountToEmail(String email, String password) => _authService.linkAccountToEmail(email, password);

  @override
  Future<UserDTO> linkAccountToFacebook() => _authService.linkAccountToFacebook();

  @override
  Future<void> setLocale(String languageCode) => _authService.setLocale(languageCode);
}
