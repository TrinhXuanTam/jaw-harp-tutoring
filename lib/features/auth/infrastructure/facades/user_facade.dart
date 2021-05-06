import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';
import 'package:jews_harp/features/auth/infrastructure/external_services/firebase_auth.dart';

/// User authentication facade that communicates with Firebase Authentication.
@LazySingleton(as: IUserAuthFacade, env: [Environment.prod, USER_AUTH_FACADE_TEST_ENV])
class UserAuthFacade extends IUserAuthFacade {
  /// Firebase Authentication external service.
  final FirebaseAuthService _authService;

  UserAuthFacade(this._authService);

  @override
  Future<User> signUpWithEmailAndPassword(String name, String email, String password) => _authService.signUpWithEmail(name, email, password);

  @override
  Future<void> sendVerificationEmail() => _authService.sendVerificationEmail();

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) => _authService.signInWithEmail(email, password);

  @override
  Future<User> signInWithFacebook() => _authService.signInWithFacebook();

  @override
  Future<User> signInWithGoogle() => _authService.signInWithGoogle();

  @override
  Future<void> signOut() => _authService.signOut();

  @override
  Future<void> resetPassword(String email) => _authService.resetPassword(email);

  @override
  Future<UserDTO> linkAccountToEmail(String email, String password) => _authService.linkAccountToEmail(email, password);

  @override
  Future<UserDTO> linkAccountToFacebook() => _authService.linkAccountToFacebook();

  @override
  Future<void> setLocale(String languageCode) => _authService.setLocale(languageCode);
}
