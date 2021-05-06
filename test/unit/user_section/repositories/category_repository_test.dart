import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/errors/NotFoundError.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/category_repository.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/category_DTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/data_sources/category_local_data_source.dart';
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: FirebaseUserSectionDataSource, env: [CATEGORY_REPOSITORY_TEST_ENV])
class FirebaseUserSectionDataSourceMock extends Mock implements FirebaseUserSectionDataSource {}

@injectable.LazySingleton(as: CategoryLocalDataSource, env: [CATEGORY_REPOSITORY_TEST_ENV])
class CategoryLocalDataSourceMock extends Mock implements CategoryLocalDataSource {}

class CategoryMock extends Mock implements CategoryDTO {}

void main() {
  testConfigureDependencies(CATEGORY_REPOSITORY_TEST_ENV);

  // Reset mock objects before each test.
  setUp(() {
    final firebaseUserSectionDataSourceMock = serviceLocator<FirebaseUserSectionDataSource>();
    final categoryLocalDataSourceMock = serviceLocator<CategoryLocalDataSource>();

    reset(firebaseUserSectionDataSourceMock);
    reset(categoryLocalDataSourceMock);
  });

  test("[getAllCategories] should return categories from Firebase when not cached.", () async {
    var fetchedFromCache = false;
    var fetchedFromFirebase = false;
    final fetchedCategories = [CategoryMock(), CategoryMock()];
    final categoryRepository = serviceLocator<ICategoryRepository>();
    final firebaseUserSectionDataSourceMock = serviceLocator<FirebaseUserSectionDataSource>();
    final categoryLocalDataSourceMock = serviceLocator<CategoryLocalDataSource>();
    when(() => categoryLocalDataSourceMock.getCachedAllCategories()).thenThrow(NotFoundError("All categories were not cached!"));
    when(() => firebaseUserSectionDataSourceMock.getAllCategories()).thenAnswer((_) async {
      fetchedFromFirebase = true;
      return fetchedCategories;
    });

    final res = await categoryRepository.getAllCategories();

    expect(res, fetchedCategories);
    expect(fetchedFromFirebase, true);
    expect(fetchedFromCache, false);
  });

  test("[getAllCategories] should return categories from local storage when cached.", () async {
    var fetchedFromCache = false;
    var fetchedFromFirebase = false;
    final fetchedCategories = [CategoryMock(), CategoryMock()];
    final categoryRepository = serviceLocator<ICategoryRepository>();
    final categoryLocalDataSourceMock = serviceLocator<CategoryLocalDataSource>();
    when(() => categoryLocalDataSourceMock.getCachedAllCategories()).thenAnswer((_) {
      fetchedFromCache = true;
      return fetchedCategories;
    });

    final res = await categoryRepository.getAllCategories();

    expect(res, fetchedCategories);
    expect(fetchedFromFirebase, false);
    expect(fetchedFromCache, true);
  });
}
