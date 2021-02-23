import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:optional/optional_internal.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class FacebookAuthentication {
  final IUserRepository _userRepository;

  FacebookAuthentication(this._userRepository);

  Future<Optional<User>> call() async {
    return _userRepository.getUserWithFacebook();
  }
}