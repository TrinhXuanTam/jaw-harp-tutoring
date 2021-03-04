import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart';
import 'package:jews_harp/features/techniques/domain/entities/category.dart';
import 'package:jews_harp/features/techniques/domain/entities/category_localized_data.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/category_localized_data_DTO.dart';

@LazySingleton(as: ICategoryAdminRepository, env: [Environment.prod])
class CategoryAdminRepository extends ICategoryAdminRepository {
  final FirebaseAdminDataSource _adminDataSource;

  CategoryAdminRepository(this._adminDataSource);

  @override
  Future<Category> createCategory(bool isVisible, Iterable<CategoryLocalizedData> localizedData) {
    return _adminDataSource.createCategory(
      isVisible,
      localizedData.map((e) => CategoryLocalizedDataDTO.fromCategoryLocalizedData(e)),
    );
  }
}
