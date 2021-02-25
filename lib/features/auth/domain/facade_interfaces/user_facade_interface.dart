abstract class IUserFacade {
  Future<void> signOut();

  Future<bool> resetPassword(String email);

  Future<bool> isVerified();

  Future<void> sendVerificationEmail();
}
