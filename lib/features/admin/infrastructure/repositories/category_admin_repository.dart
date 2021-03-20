import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/category_localized_data.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/category_localized_data_DTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart';

@LazySingleton(as: ICategoryAdminRepository, env: [Environment.prod])
class CategoryAdminRepository extends ICategoryAdminRepository {
  final FirebaseAdminDataSource _adminDataSource;
  final FirebaseUserSectionDataSource _userSectionDataSource;

  CategoryAdminRepository(this._adminDataSource, this._userSectionDataSource);

  @override
  Future<Category> createCategory(bool isVisible, Iterable<CategoryLocalizedData> localizedData) {
    return _adminDataSource.createCategory(isVisible, localizedData.toDTO());
  }

  @override
  Future<Category> updateCategory(
    String id, {
    bool? isVisible,
    Iterable<CategoryLocalizedData>? localizedData,
  }) {
    return _adminDataSource.updateCategory(
      id,
      isVisible: isVisible,
      localizedData: localizedData?.map((e) => CategoryLocalizedDataDTO.fromEntity(e)),
    );
  }

  @override
  Future<Iterable<Category>> getHiddenCategories() => _adminDataSource.getHiddenCategories();

  @override
  Future<Iterable<Category>> getAllCategories() => _adminDataSource.getAllCategories();

  @override
  Future<Iterable<Category>> getVisibleCategories() => _userSectionDataSource.getAllCategories();
}
