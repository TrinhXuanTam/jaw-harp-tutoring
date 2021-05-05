import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/language_codes.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/admin/domain/domain/category_localized_data.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';
import 'package:jews_harp/features/admin/infrastructure/DTO/category_localized_data_DTO.dart';
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/category_DTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/mediaDTO.dart';
import 'package:mocktail/mocktail.dart';
import 'package:optional/optional.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: FirebaseAdminDataSource, env: [CATEGORY_ADMIN_REPOSITORY_TEST_ENV])
class FirebaseAdminDataSourceMock extends Mock implements FirebaseAdminDataSource {}

void main() {
  testConfigureDependencies(CATEGORY_ADMIN_REPOSITORY_TEST_ENV);

  final id = "id";
  final isVisible = true;
  final techniqueIds = ["technique1", "technique2"];
  final title = "title";
  final description = "description";
  final thumbnail = Optional<MediaDTO>.empty();

  final categoryLocalizedData = CategoryLocalizedData(
    languageCode: ENGLISH_CODE,
    title: title,
    description: description,
  );

  final visibleCategoryDTO = CategoryDTO(
    id: id,
    isVisible: isVisible,
    techniqueIds: techniqueIds,
    title: title,
    description: description,
    thumbnail: thumbnail,
  );

  final hiddenCategoryDTO = CategoryDTO(
    id: id,
    isVisible: !isVisible,
    techniqueIds: techniqueIds,
    title: title,
    description: description,
    thumbnail: thumbnail,
  );

  // Reset mock objects before each test.
  setUp(() {
    final firebaseAdminDataSource = serviceLocator<FirebaseAdminDataSource>();
    reset(firebaseAdminDataSource);
  });

  test("[createCategory] should return 'CategoryDTO' entity when new category was created.", () async {
    final categoryAdminRepository = serviceLocator<ICategoryAdminRepository>();
    final firebaseAdminDataSource = serviceLocator<FirebaseAdminDataSource>();
    when(() => firebaseAdminDataSource.createCategory(isVisible, thumbnail, any())).thenAnswer((_) async => visibleCategoryDTO);

    final res = await categoryAdminRepository.createCategory(isVisible: isVisible, thumbnail: Optional<Media>.empty(), localizedData: [categoryLocalizedData]);

    expect(res, visibleCategoryDTO);
  });

  test("[updateCategory] should return 'CategoryDTO' entity when category was updated.", () async {
    final categoryAdminRepository = serviceLocator<ICategoryAdminRepository>();
    final firebaseAdminDataSource = serviceLocator<FirebaseAdminDataSource>();
    when(() => firebaseAdminDataSource.updateCategory(id: id, isVisible: isVisible, thumbnail: thumbnail, localizedData: any(named: "localizedData"))).thenAnswer((_) async => visibleCategoryDTO);

    final res = await categoryAdminRepository.updateCategory(id: id, isVisible: isVisible, thumbnail: Optional<Media>.empty(), localizedData: [categoryLocalizedData]);

    expect(res, visibleCategoryDTO);
  });

  test("[getAllCategories] should return all 'CategoryDTO' when invoked.", () async {
    final categoryAdminRepository = serviceLocator<ICategoryAdminRepository>();
    final firebaseAdminDataSource = serviceLocator<FirebaseAdminDataSource>();
    when(() => firebaseAdminDataSource.getAllCategories()).thenAnswer((_) async => [visibleCategoryDTO, hiddenCategoryDTO]);

    final res = await categoryAdminRepository.getAllCategories();

    expect(res, [visibleCategoryDTO, hiddenCategoryDTO]);
  });

  test("[getHiddenCategories] should return all hidden 'CategoryDTO' when invoked.", () async {
    final categoryAdminRepository = serviceLocator<ICategoryAdminRepository>();
    final firebaseAdminDataSource = serviceLocator<FirebaseAdminDataSource>();
    when(() => firebaseAdminDataSource.getHiddenCategories()).thenAnswer((_) async => [hiddenCategoryDTO]);

    final res = await categoryAdminRepository.getHiddenCategories();

    expect(res, [hiddenCategoryDTO]);
  });

  test("[getVisibleCategories] should return all visible 'CategoryDTO' when invoked.", () async {
    final categoryAdminRepository = serviceLocator<ICategoryAdminRepository>();
    final firebaseAdminDataSource = serviceLocator<FirebaseAdminDataSource>();
    when(() => firebaseAdminDataSource.getVisibleCategories()).thenAnswer((_) async => [visibleCategoryDTO]);

    final res = await categoryAdminRepository.getVisibleCategories();

    expect(res, [visibleCategoryDTO]);
  });

  test("[getLocalizedData] should return localized data visible of a category when category exists.", () async {
    final localizedData = CategoryLocalizedDataDTO(languageCode: ENGLISH_CODE, title: visibleCategoryDTO.title, description: visibleCategoryDTO.description);
    final categoryId = visibleCategoryDTO.id;
    final categoryAdminRepository = serviceLocator<ICategoryAdminRepository>();
    final firebaseAdminDataSource = serviceLocator<FirebaseAdminDataSource>();
    when(() => firebaseAdminDataSource.getCategoryLocalizedData(categoryId)).thenAnswer((_) async => {ENGLISH_CODE: localizedData});

    final res = await categoryAdminRepository.getLocalizedData(categoryId);

    expect(res, {ENGLISH_CODE: localizedData});
  });
}
