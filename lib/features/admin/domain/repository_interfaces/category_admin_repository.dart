import 'dart:io';

import 'package:jews_harp/features/techniques/domain/entities/category.dart';
import 'package:jews_harp/features/techniques/domain/entities/category_localized_data.dart';
import 'package:jews_harp/features/techniques/domain/entities/media.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique_localized_data.dart';
import 'package:optional/optional_internal.dart';

abstract class ICategoryAdminRepository {
  Future<Technique> createTechnique({
    required Optional<String> productId,
    required String categoryId,
    required TechniqueDifficulty difficulty,
    required Iterable<TechniqueLocalizedData> localizedData,
    required Optional<Media> thumbnail,
    required Optional<Media> video,
  });

  Future<Category> createCategory(bool isVisible, Iterable<CategoryLocalizedData> localizedData);

  Future<Category> updateCategory(Category category);

  Future<Iterable<Category>> getVisibleCategories();

  Future<Iterable<Category>> getHiddenCategories();

  Future<Iterable<Category>> getAllCategories();

  Future<Iterable<Technique>> getTechniquesByCategory(Category category);
}
