import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart';
import 'package:jews_harp/features/techniques/domain/entities/category.dart';
import 'package:jews_harp/features/techniques/domain/entities/category_localized_data.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique_localized_data.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/category_localized_data_DTO.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/technique_localized_data_DTO.dart';

@LazySingleton(as: ICategoryAdminRepository, env: [Environment.prod])
class CategoryAdminRepository extends ICategoryAdminRepository {
  final FirebaseAdminDataSource _adminDataSource;

  CategoryAdminRepository(this._adminDataSource);

  @override
  Future<Technique> createTechnique(
    String id,
    String categoryId,
    TechniqueDifficulty difficulty,
    Iterable<TechniqueLocalizedData> localizedData,
    File? thumbnail,
    File? video,
  ) {
    return _adminDataSource.createTechnique(
      id,
      categoryId,
      difficulty,
      localizedData.map((e) => TechniqueLocalizedDataDTO.fromCategoryLocalizedData(e)),
      thumbnail,
      video,
    );
  }

  @override
  Future<Category> createCategory(bool isVisible, Iterable<CategoryLocalizedData> localizedData) {
    return _adminDataSource.createCategory(
      isVisible,
      localizedData.map((e) => CategoryLocalizedDataDTO.fromCategoryLocalizedData(e)),
    );
  }

  @override
  Future<Iterable<Category>> getHiddenCategories() => _adminDataSource.getHiddenCategories();

  @override
  Future<Iterable<Category>> getVisibleCategories() => _adminDataSource.getVisibleCategories();

  @override
  Future<Iterable<Category>> getAllCategories() => _adminDataSource.getAllCategories();
}
