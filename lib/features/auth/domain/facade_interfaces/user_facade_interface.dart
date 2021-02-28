import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';

abstract class IUserFacade {
  Future<void> signOut();

  Future<bool> resetPassword(String email, {String languageCode});

  Future<bool> isVerified();

  Future<void> sendVerificationEmail({String languageCode});

  Future<UserDTO> linkAccountToEmail(String email, String password);

  Future<UserDTO> linkAccountToFacebook();
}
