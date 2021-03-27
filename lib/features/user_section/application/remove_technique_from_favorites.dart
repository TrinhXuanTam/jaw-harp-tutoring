import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/user_repository.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class RemoveTechniqueFromFavorites {
  final IUserRepository _userRepository;

  RemoveTechniqueFromFavorites(this._userRepository);

  Future<void> call(String techniqueId) => _userRepository.removeTechniqueFromFavorites(techniqueId);
}
