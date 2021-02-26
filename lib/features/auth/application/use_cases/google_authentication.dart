import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class GoogleAuthentication {
  final IUserRepository _userRepository;

  GoogleAuthentication(this._userRepository);

  Future<User> call() async => _userRepository.getUserWithGoogle();
}
