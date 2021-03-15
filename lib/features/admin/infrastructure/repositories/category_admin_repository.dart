import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart';
import 'package:jews_harp/features/techniques/domain/entities/category.dart';
import 'package:jews_harp/features/techniques/domain/entities/category_localized_data.dart';
import 'package:jews_harp/features/techniques/domain/entities/media.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique_localized_data.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/category_DTO.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/category_localized_data_DTO.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/mediaDTO.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/technique_localized_data_DTO.dart';
import 'package:optional/optional.dart';

@LazySingleton(as: ICategoryAdminRepository, env: [Environment.prod])
class CategoryAdminRepository extends ICategoryAdminRepository {
  final FirebaseAdminDataSource _adminDataSource;

  CategoryAdminRepository(this._adminDataSource);

  @override
  Future<Technique> createTechnique({
    required Optional<String> productId,
    required String categoryId,
    required TechniqueDifficulty difficulty,
    required Iterable<TechniqueLocalizedData> localizedData,
    required Optional<Media> thumbnail,
    required Optional<Media> video,
  }) {
    return _adminDataSource.createTechnique(
      productId: productId,
      categoryId: categoryId,
      difficulty: difficulty,
      localizedData: localizedData.toDTO(),
      thumbnail: thumbnail.map((t) => MediaDTO.fromEntity(t)),
      video: video.map((v) => MediaDTO.fromEntity(v)),
    );
  }

  @override
  Future<Category> createCategory(bool isVisible, Iterable<CategoryLocalizedData> localizedData) {
    return _adminDataSource.createCategory(isVisible, localizedData.toDTO());
  }

  @override
  Future<Category> updateCategory(Category category) => _adminDataSource.updateCategory(CategoryDTO.fromEntity(category));

  @override
  Future<Iterable<Category>> getHiddenCategories() => _adminDataSource.getHiddenCategories();

  @override
  Future<Iterable<Category>> getVisibleCategories() => _adminDataSource.getVisibleCategories();

  @override
  Future<Iterable<Category>> getAllCategories() => _adminDataSource.getAllCategories();

  @override
  Future<Iterable<Technique>> getTechniquesByCategory(Category category) => _adminDataSource.getTechniquesById(category.techniqueIds);
}
