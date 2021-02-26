import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';

/// Create a new account use case
@LazySingleton(env: [Environment.prod, Environment.dev])
class GetAuthProviders {
  final IUserRepository _userRepository;

  GetAuthProviders(this._userRepository);

  Future<Set<String>> call(String email) => _userRepository.getAuthProviders(email);
}
