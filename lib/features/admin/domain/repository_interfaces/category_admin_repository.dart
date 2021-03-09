import 'dart:io';

import 'package:jews_harp/features/techniques/domain/entities/category.dart';
import 'package:jews_harp/features/techniques/domain/entities/category_localized_data.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique_localized_data.dart';

abstract class ICategoryAdminRepository {
  Future<Technique> createTechnique(String id, String categoryId, TechniqueDifficulty difficulty, Iterable<TechniqueLocalizedData> localizedData, File? thumbnail, File? video);

  Future<Category> createCategory(bool isVisible, Iterable<CategoryLocalizedData> localizedData);

  Future<Iterable<Category>> getVisibleCategories();

  Future<Iterable<Category>> getHiddenCategories();

  Future<Iterable<Category>> getAllCategories();
}
