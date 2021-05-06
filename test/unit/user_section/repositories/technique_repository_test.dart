import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/errors/NotFoundError.dart';
import 'package:jews_harp/features/user_section/domain/entities/product_info.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/category_DTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/product_info_DTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/technique_DTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart';
import 'package:jews_harp/features/user_section/infrastructure/data_sources/technique_local_data_source.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: FirebaseUserSectionDataSource, env: [TECHNIQUE_REPOSITORY_TEST_ENV])
class FirebaseUserSectionDataSourceMock extends Mock implements FirebaseUserSectionDataSource {}

@injectable.LazySingleton(as: TechniqueLocalDataSource, env: [TECHNIQUE_REPOSITORY_TEST_ENV])
class TechniqueLocalDataSourceMock extends Mock implements TechniqueLocalDataSource {}

class TechniqueMock extends Mock implements TechniqueDTO {}

class CategoryMock extends Mock implements CategoryDTO {}

void main() {
  testConfigureDependencies(TECHNIQUE_REPOSITORY_TEST_ENV);

  // Reset mock objects before each test.
  setUp(() {
    final firebaseUserSectionDataSourceMock = serviceLocator<FirebaseUserSectionDataSource>();
    final techniqueLocalDataSourceMock = serviceLocator<TechniqueLocalDataSource>();

    reset(firebaseUserSectionDataSourceMock);
    reset(techniqueLocalDataSourceMock);
  });

  test("[getAllTechniques] should return techniques from Firebase when not cached.", () async {
    var fetchedFromCache = false;
    var fetchedFromFirebase = false;
    final fetchedTechniques = [TechniqueMock(), TechniqueMock()];
    final techniqueRepository = serviceLocator<ITechniqueRepository>();
    final firebaseUserSectionDataSourceMock = serviceLocator<FirebaseUserSectionDataSource>();
    final techniqueLocalDataSourceMock = serviceLocator<TechniqueLocalDataSource>();
    when(() => techniqueLocalDataSourceMock.getCachedAllTechniques()).thenThrow(NotFoundError("All techniques were not cached!"));
    when(() => firebaseUserSectionDataSourceMock.getAllTechniques()).thenAnswer((_) async {
      fetchedFromFirebase = true;
      return fetchedTechniques;
    });

    final res = await techniqueRepository.getAllTechniques();

    expect(res, fetchedTechniques);
    expect(fetchedFromFirebase, true);
    expect(fetchedFromCache, false);
  });

  test("[getAllTechniques] should return techniques from local storage when cached.", () async {
    var fetchedFromCache = false;
    var fetchedFromFirebase = false;
    final fetchedTechnique = [TechniqueMock(), TechniqueMock()];
    final techniqueRepository = serviceLocator<ITechniqueRepository>();
    final techniqueLocalDataSourceMock = serviceLocator<TechniqueLocalDataSource>();
    when(() => techniqueLocalDataSourceMock.getCachedAllTechniques()).thenAnswer((_) {
      fetchedFromCache = true;
      return fetchedTechnique;
    });

    final res = await techniqueRepository.getAllTechniques();

    expect(res, fetchedTechnique);
    expect(fetchedFromFirebase, false);
    expect(fetchedFromCache, true);
  });

  test("[getAllTechniques] should return most recent techniques from Firebase when not cached.", () async {
    var fetchedFromCache = false;
    var fetchedFromFirebase = false;
    final fetchedTechniques = [TechniqueMock(), TechniqueMock()];
    final techniqueRepository = serviceLocator<ITechniqueRepository>();
    final firebaseUserSectionDataSourceMock = serviceLocator<FirebaseUserSectionDataSource>();
    final techniqueLocalDataSourceMock = serviceLocator<TechniqueLocalDataSource>();
    when(() => techniqueLocalDataSourceMock.getCachedMostRecentTechniques()).thenThrow(NotFoundError("All techniques were not cached!"));
    when(() => firebaseUserSectionDataSourceMock.getMostRecentTechniques()).thenAnswer((_) async {
      fetchedFromFirebase = true;
      return fetchedTechniques;
    });

    final res = await techniqueRepository.getMostRecentTechniques();

    expect(res, fetchedTechniques);
    expect(fetchedFromFirebase, true);
    expect(fetchedFromCache, false);
  });

  test("[getMostRecentTechniques] should return most recent techniques from local storage when cached.", () async {
    var fetchedFromCache = false;
    var fetchedFromFirebase = false;
    final fetchedTechniques = [TechniqueMock(), TechniqueMock()];
    final techniqueRepository = serviceLocator<ITechniqueRepository>();
    final techniqueLocalDataSourceMock = serviceLocator<TechniqueLocalDataSource>();
    when(() => techniqueLocalDataSourceMock.getCachedMostRecentTechniques()).thenAnswer((_) {
      fetchedFromCache = true;
      return fetchedTechniques;
    });

    final res = await techniqueRepository.getMostRecentTechniques();

    expect(res, fetchedTechniques);
    expect(fetchedFromFirebase, false);
    expect(fetchedFromCache, true);
  });

  test("[getTechniqueById] should return technique by ID from firebase when not cached.", () async {
    var fetchedFromCache = false;
    var fetchedFromFirebase = false;
    final techniqueId = "id";
    final technique = TechniqueMock();
    final techniqueRepository = serviceLocator<ITechniqueRepository>();
    final firebaseUserSectionDataSourceMock = serviceLocator<FirebaseUserSectionDataSource>();
    final techniqueLocalDataSourceMock = serviceLocator<TechniqueLocalDataSource>();
    when(() => techniqueLocalDataSourceMock.getCachedTechnique(techniqueId)).thenThrow(NotFoundError("Technique with given ID was not cached!"));
    when(() => firebaseUserSectionDataSourceMock.getTechniqueById(techniqueId)).thenAnswer((_) async {
      fetchedFromFirebase = true;
      return technique;
    });

    final res = await techniqueRepository.getTechniqueById(techniqueId);

    expect(res, technique);
    expect(fetchedFromFirebase, true);
    expect(fetchedFromCache, false);
  });

  test("[getTechniqueById] should return technique by ID from local storage when cached.", () async {
    var fetchedFromCache = false;
    var fetchedFromFirebase = false;
    final techniqueId = "id";
    final technique = TechniqueMock();
    final techniqueRepository = serviceLocator<ITechniqueRepository>();
    final techniqueLocalDataSourceMock = serviceLocator<TechniqueLocalDataSource>();
    when(() => techniqueLocalDataSourceMock.getCachedTechnique(techniqueId)).thenAnswer((_) {
      fetchedFromCache = true;
      return technique;
    });

    final res = await techniqueRepository.getTechniqueById(techniqueId);

    expect(res, technique);
    expect(fetchedFromFirebase, false);
    expect(fetchedFromCache, true);
  });

  test("[getTechniquesByCategory] should return technique by category from firebase when not cached.", () async {
    var fetchedFromCache = false;
    var fetchedFromFirebase = false;
    final techniqueId = "id";
    final technique = TechniqueMock();
    final category = CategoryMock();
    final techniqueRepository = serviceLocator<ITechniqueRepository>();
    final firebaseUserSectionDataSourceMock = serviceLocator<FirebaseUserSectionDataSource>();
    final techniqueLocalDataSourceMock = serviceLocator<TechniqueLocalDataSource>();
    when(() => category.techniqueIds).thenReturn([techniqueId]);
    when(() => techniqueLocalDataSourceMock.getCachedTechnique(techniqueId)).thenThrow(NotFoundError("Technique with given ID was not cached!"));
    when(() => firebaseUserSectionDataSourceMock.getTechniqueById(techniqueId)).thenAnswer((_) async {
      fetchedFromFirebase = true;
      return technique;
    });

    final res = await techniqueRepository.getTechniquesByCategory(category);

    expect(res, [technique]);
    expect(fetchedFromFirebase, true);
    expect(fetchedFromCache, false);
  });

  test("[getTechniquesByCategory] should return technique by category from local storage when cached.", () async {
    var fetchedFromCache = false;
    var fetchedFromFirebase = false;
    final techniqueId = "id";
    final technique = TechniqueMock();
    final category = CategoryMock();
    final techniqueRepository = serviceLocator<ITechniqueRepository>();
    final techniqueLocalDataSourceMock = serviceLocator<TechniqueLocalDataSource>();
    when(() => category.techniqueIds).thenReturn([techniqueId]);
    when(() => techniqueLocalDataSourceMock.getCachedTechnique(techniqueId)).thenAnswer((_) {
      fetchedFromCache = true;
      return technique;
    });

    final res = await techniqueRepository.getTechniquesByCategory(category);

    expect(res, [technique]);
    expect(fetchedFromFirebase, false);
    expect(fetchedFromCache, true);
  });

  test("[downloadTechnique] Should return 'Technique' entity when download is complete.", () async {
    final techniqueId = "id";
    final technique = TechniqueDTO(
      id: techniqueId,
      title: "title",
      category: CategoryDTO(
        id: "categoryId",
        isVisible: true,
        description: "description",
        title: "title",
        techniqueIds: ["id"],
      ),
      difficulty: TechniqueDifficulty.beginner,
      productInfo: ProductInfoDTO(ProductType.free),
      description: "description",
      accompanyingText: "accompanyingText",
    );
    final techniqueRepository = serviceLocator<ITechniqueRepository>();
    final techniqueLocalDataSourceMock = serviceLocator<TechniqueLocalDataSource>();
    when(() => techniqueLocalDataSourceMock.getCachedTechnique(techniqueId)).thenAnswer((_) {
      return TechniqueDTO.fromEntity(technique);
    });

    when(() => techniqueLocalDataSourceMock.downloadTechnique(technique)).thenAnswer((_) async {
      return technique;
    });

    final res = await techniqueRepository.downloadTechnique(techniqueId);

    expect(res, technique);
  });

  test("[deleteDownloadedTechnique] Should delete saved technique from local storage when invoked.", () async {
    var deletedFromStorage = false;
    final techniqueId = "id";
    final techniqueRepository = serviceLocator<ITechniqueRepository>();
    final techniqueLocalDataSourceMock = serviceLocator<TechniqueLocalDataSource>();
    when(() => techniqueLocalDataSourceMock.deleteDownloadedTechnique(techniqueId)).thenAnswer((_) async {
      deletedFromStorage = true;
    });

    await techniqueRepository.deleteDownloadedTechnique(techniqueId);

    expect(deletedFromStorage, true);
  });

  test("[getDownloadedTechniques]", () async {
    final fetchedTechniques = [TechniqueMock(), TechniqueMock()];
    final techniqueRepository = serviceLocator<ITechniqueRepository>();
    final techniqueLocalDataSourceMock = serviceLocator<TechniqueLocalDataSource>();
    when(() => techniqueLocalDataSourceMock.getDownloadedTechniques()).thenAnswer((_) async {
      return fetchedTechniques;
    });

    final res = await techniqueRepository.getDownloadedTechniques();

    expect(res, fetchedTechniques);
  });
}
