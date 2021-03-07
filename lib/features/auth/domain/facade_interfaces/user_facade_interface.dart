import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';

abstract class IUserFacade {
  Future<void> setLocale(String languageCode);

  Future<void> signOut();

  Future<bool> resetPassword(String email);

  Future<bool> isVerified();

  Future<void> sendVerificationEmail();

  Future<UserDTO> linkAccountToEmail(String email, String password);

  Future<UserDTO> linkAccountToFacebook();
}
