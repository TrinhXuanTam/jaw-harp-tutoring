import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/user_section/application/get_techniques_by_category.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/product_info.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: ITechniqueRepository, env: [GET_PUBLISHED_TECHNIQUES_BY_CATEGORY_TEST_ENV])
class TechniqueRepositoryMock extends Mock implements ITechniqueRepository {}

void main() {
  testConfigureDependencies(GET_PUBLISHED_TECHNIQUES_BY_CATEGORY_TEST_ENV);

  // Reset mock objects before each test.
  setUp(() {
    final techniqueRepositoryMock = serviceLocator<ITechniqueRepository>();
    reset(techniqueRepositoryMock);
  });

  test("[GetTechniqueById] should return technique entity when technique with given id exists.", () async {
    final category = Category(
      id: "categoryId",
      isVisible: true,
      techniqueIds: ["technique1", "technique2"],
      title: "title",
      description: "description",
    );

    final technique1 = Technique(
      id: "technique1",
      title: "title",
      category: category,
      difficulty: TechniqueDifficulty.beginner,
      productInfo: ProductInfo(ProductType.free),
      description: "description",
      accompanyingText: "accompanyingText",
    );

    final technique2 = Technique(
      id: "technique2",
      title: "title",
      category: category,
      difficulty: TechniqueDifficulty.advanced,
      productInfo: ProductInfo(ProductType.unavailable),
      description: "description",
      accompanyingText: "accompanyingText",
    );
    final fetchedTechniques = [technique1, technique2];
    final getTechniquesByCategory = serviceLocator<GetTechniquesByCategory>();
    final techniqueRepositoryMock = serviceLocator<ITechniqueRepository>();
    when(() => techniqueRepositoryMock.getTechniquesByCategory(category)).thenAnswer((_) async => fetchedTechniques);

    final res = await getTechniquesByCategory(category);

    expect(res, fetchedTechniques);
  });
}
