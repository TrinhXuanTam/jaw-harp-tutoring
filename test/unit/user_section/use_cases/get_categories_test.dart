import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/user_section/application/get_categories.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/category_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: ICategoryRepository, env: [GET_CATEGORIES_TEST_ENV])
class CategoryRepositoryMock extends Mock implements ICategoryRepository {}

void main() {
  testConfigureDependencies(GET_CATEGORIES_TEST_ENV);

  // Reset mock objects before each test.
  setUp(() {
    final categoryRepository = serviceLocator<ICategoryRepository>();
    reset(categoryRepository);
  });

  test("[GetCategories] should return a list of all categories when invoked.", () async {
    final category1 = Category(
      id: "id",
      isVisible: true,
      techniqueIds: ["technique1", "technique2"],
      title: "title",
      description: "description",
    );
    final category2 = Category(
      id: "id2",
      isVisible: true,
      techniqueIds: ["technique1", "technique2"],
      title: "title2",
      description: "description2",
    );
    final fetchedCategories = [category1, category2];
    final getCategories = serviceLocator<GetCategories>();
    final categoryRepository = serviceLocator<ICategoryRepository>();
    when(() => categoryRepository.getAllCategories()).thenAnswer((_) async => fetchedCategories);

    final res = await getCategories();

    expect(res, fetchedCategories);
  });
}
