import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/category_localized_data.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:optional/optional.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class CreateCategory {
  final ICategoryAdminRepository _adminRepository;

  CreateCategory(this._adminRepository);

  Future<Category> call(
    bool isVisible,
    Optional<Media> thumbnail,
    Iterable<CategoryLocalizedData> localizedData,
  ) {
    return _adminRepository.createCategory(isVisible, thumbnail, localizedData);
  }
}
