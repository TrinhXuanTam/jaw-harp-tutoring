import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/features/admin/domain/domain/category_localized_data.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:optional/optional.dart';

/// Create a new category.
@LazySingleton(env: [Environment.prod, Environment.dev, CREATE_CATEGORY_TEST_ENV])
class CreateCategory {
  final ICategoryAdminRepository _adminRepository;

  CreateCategory(this._adminRepository);

  Future<Category> call(
    bool isVisible,
    Optional<Media> thumbnail,
    Iterable<CategoryLocalizedData> localizedData,
  ) {
    return _adminRepository.createCategory(
      isVisible: isVisible,
      thumbnail: thumbnail,
      localizedData: localizedData,
    );
  }
}
