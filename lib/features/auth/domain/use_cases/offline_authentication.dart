import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:optional/optional.dart';

class OfflineAuthentication {
  final IUserRepository _userRepository;

  OfflineAuthentication(this._userRepository);

  Future<Optional<User>> call() async {
    return _userRepository.getCurrentUser();
  }
}