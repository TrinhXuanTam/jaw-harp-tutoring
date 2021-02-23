import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class FacebookAuthentication {
  final IUserRepository _userRepository;

  FacebookAuthentication(this._userRepository);

  Future<User> call() async {
    final user = await _userRepository.getUserWithFacebook();

    return user.value;
  }
}
