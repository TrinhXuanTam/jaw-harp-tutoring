import 'package:jews_harp/features/auth/domain/entities/user.dart';

abstract class IUserAuthRepository {
  Future<User> createUser(String name, String email, String password);

  Future<User?> getCurrentUser();

  Future<User> reloadUser();

  Future<User> getUserWithEmailAndPassword(String email, String password);

  Future<User> getUserWithFacebook();

  Future<User> getUserWithGoogle();

  Future<Set<String>> getAuthProviders(String email);

  Future<void> setLocale(String languageCode);
}
