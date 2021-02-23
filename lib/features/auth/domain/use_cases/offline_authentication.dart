import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants.dart';
import 'package:jews_harp/core/errors/user_not_signed_in_error.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/repository_interfaces/user_repository_interface.dart';

/// Get cached user use case
@LazySingleton(env: [Environment.prod, Environment.dev, OFFLINE_AUTHENTICATION_TEST_ENV])
class OfflineAuthentication {
  final IUserRepository _userRepository;

  OfflineAuthentication(this._userRepository);

  Future<User> call() async {
    final user = await _userRepository.getCurrentUser();

    if (user.isEmpty) throw UserNotSignedInError();

    return user.value;
  }
}
