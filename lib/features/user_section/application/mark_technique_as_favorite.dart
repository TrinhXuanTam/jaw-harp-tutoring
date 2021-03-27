import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/user_repository.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class MarkTechniqueAsFavorite {
  final IUserRepository _userRepository;

  MarkTechniqueAsFavorite(this._userRepository);

  Future<void> call(String techniqueId) => _userRepository.markTechniqueAsFavorite(techniqueId);
}
