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
  Future<void> signOut() => signOut();

  @override
  Future<bool> isVerified() => isVerified();

  @override
  Future<void> sendVerificationEmail() => sendVerificationEmail();

  @override
  Future<UserDTO> linkAccountToEmail(String email, String password) => linkAccountToEmail(email, password);

  @override
  Future<UserDTO> linkAccountToFacebook() => linkAccountToFacebook();

  @override
  Future<void> setLocale(String languageCode) => setLocale(languageCode);
}
