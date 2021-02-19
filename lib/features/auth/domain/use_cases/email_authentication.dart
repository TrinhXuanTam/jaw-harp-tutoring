import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';
import 'package:optional/optional_internal.dart';

@lazySingleton
class EmailAuthentication {
  final IUserRepository _userRepository;

  EmailAuthentication(this._userRepository);

  Future<Optional<User>> call(String email, String password) async {
    return _userRepository.getCurrentUser();
  }
}
