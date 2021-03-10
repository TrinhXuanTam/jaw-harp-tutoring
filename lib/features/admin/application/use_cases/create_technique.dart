import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique_localized_data.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class CreateTechnique {
  final ICategoryAdminRepository _adminRepository;

  CreateTechnique(this._adminRepository);

  Future<Technique> call({
    required String id,
    required String categoryId,
    required TechniqueDifficulty difficulty,
    required Iterable<TechniqueLocalizedData> localizedData,
    File? thumbnail,
    File? video,
  }) {
    return _adminRepository.createTechnique(id: id, categoryId: categoryId, difficulty: difficulty, localizedData: localizedData, thumbnail: thumbnail, video: video);
  }
}
