import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/language_codes.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart';
import 'package:jews_harp/features/admin/infrastructure/DTO/technique_localized_data_DTO.dart';
import 'package:jews_harp/features/admin/infrastructure/data_sources/firebase_admin_data_source.dart';
import 'package:jews_harp/features/user_section/domain/entities/product_info.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/category_DTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/mediaDTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/product_info_DTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/technique_DTO.dart';
import 'package:mocktail/mocktail.dart';
import 'package:optional/optional.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: FirebaseAdminDataSource, env: [TECHNIQUE_ADMIN_REPOSITORY_TEST_ENV])
class FirebaseAdminDataSourceMock extends Mock implements FirebaseAdminDataSource {}

void main() {
  testConfigureDependencies(TECHNIQUE_ADMIN_REPOSITORY_TEST_ENV);

  final id = "id";
  final productId = Optional<String>.empty();
  final productInfo = ProductInfoDTO(ProductType.free);
  final categoryDTO = CategoryDTO(
    id: "categoryId",
    isVisible: true,
    techniqueIds: [id],
    title: "categoryTitle",
    description: "categoryDescription",
  );
  final difficulty = TechniqueDifficulty.beginner;
  final title = "title";
  final description = "description";
  final accompanyingText = "accompanying text";
  final thumbnail = Optional<MediaDTO>.empty();
  final video = Optional<MediaDTO>.empty();

  final techniqueDTO = TechniqueDTO(
    id: id,
    productId: productId,
    productInfo: productInfo,
    category: categoryDTO,
    difficulty: difficulty,
    title: title,
    description: description,
    accompanyingText: accompanyingText,
    thumbnail: thumbnail,
    video: video,
  );

  // Reset mock objects before each test.
  setUp(() {
    final firebaseAdminDataSource = serviceLocator<FirebaseAdminDataSource>();
    reset(firebaseAdminDataSource);
  });

  test("[createTechnique] should return 'TechniqueDTO' when the new technique is successfully created.", () async {
    final techniqueAdminRepository = serviceLocator<ITechniqueAdminRepository>();
    final firebaseAdminDataSource = serviceLocator<FirebaseAdminDataSource>();
    when(
      () => firebaseAdminDataSource.createTechnique(
        productId: productId,
        categoryId: categoryDTO.id,
        difficulty: difficulty,
        localizedData: any(named: "localizedData"),
        thumbnail: thumbnail,
        video: video,
      ),
    ).thenAnswer((_) async => techniqueDTO);

    final res = await techniqueAdminRepository.createTechnique(
      productId: productId,
      categoryId: categoryDTO.id,
      difficulty: difficulty,
      localizedData: [],
      thumbnail: thumbnail,
      video: video,
    );

    expect(res, techniqueDTO);
  });

  test("[updateTechnique] should return 'TechniqueDTO' when the technique is successfully updated.", () async {
    final techniqueAdminRepository = serviceLocator<ITechniqueAdminRepository>();
    final firebaseAdminDataSource = serviceLocator<FirebaseAdminDataSource>();
    when(
      () => firebaseAdminDataSource.updateTechnique(
        id: id,
        productId: productId,
        categoryId: categoryDTO.id,
        difficulty: difficulty,
        localizedData: any(named: "localizedData"),
        thumbnail: thumbnail,
        video: video,
      ),
    ).thenAnswer((_) async => techniqueDTO);

    final res = await techniqueAdminRepository.updateTechnique(
      id: id,
      productId: productId,
      categoryId: categoryDTO.id,
      difficulty: difficulty,
      localizedData: [],
      thumbnail: thumbnail,
      video: video,
    );

    expect(res, techniqueDTO);
  });

  test("[getAllTechniques] should return iterable of 'TechniqueDTO' when invoked.", () async {
    final techniqueDTO2 = TechniqueDTO(
      id: "id2",
      productInfo: productInfo,
      category: categoryDTO,
      difficulty: difficulty,
      title: title,
      description: description,
      accompanyingText: accompanyingText,
    );
    final allTechniques = [techniqueDTO, techniqueDTO2];
    final techniqueAdminRepository = serviceLocator<ITechniqueAdminRepository>();
    final firebaseAdminDataSource = serviceLocator<FirebaseAdminDataSource>();
    when(() => firebaseAdminDataSource.getAllTechniques()).thenAnswer((_) async => allTechniques);

    final res = await techniqueAdminRepository.getAllTechniques();

    expect(res, allTechniques);
  });

  test("[getTechniquesByCategory] should return iterable of 'TechniqueDTO' when invoked.", () async {
    final techniqueAdminRepository = serviceLocator<ITechniqueAdminRepository>();
    final firebaseAdminDataSource = serviceLocator<FirebaseAdminDataSource>();
    when(() => firebaseAdminDataSource.getTechniqueByID(id)).thenAnswer((_) async => techniqueDTO);

    final res = await techniqueAdminRepository.getTechniquesByCategory(categoryDTO);

    expect(res, [techniqueDTO]);
  });

  test("[getLocalizedData] should return localized data visible of a category when category exists.", () async {
    final localizedData = TechniqueLocalizedDataDTO(
      languageCode: ENGLISH_CODE,
      title: techniqueDTO.title,
      description: techniqueDTO.description,
      accompanyingText: techniqueDTO.accompanyingText,
    );
    final techniqueAdminRepository = serviceLocator<ITechniqueAdminRepository>();
    final firebaseAdminDataSource = serviceLocator<FirebaseAdminDataSource>();
    when(() => firebaseAdminDataSource.getTechniqueLocalizedData(id)).thenAnswer((_) async => {localizedData.languageCode: localizedData});

    final res = await techniqueAdminRepository.getLocalizedData(id);

    expect(res, {ENGLISH_CODE: localizedData});
  });
}
