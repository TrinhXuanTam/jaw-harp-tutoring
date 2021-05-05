import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/admin/application/use_cases/get_visible_categories.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: ICategoryAdminRepository, env: [GET_VISIBLE_CATEGORIES_TEST_ENV])
class CategoryAdminRepository extends Mock implements ICategoryAdminRepository {}

void main() {
  testConfigureDependencies(GET_VISIBLE_CATEGORIES_TEST_ENV);

  final id = "id";
  final isVisible = true;
  final techniqueIds = ["id1", "id2"];
  final title = "title";
  final description = "description";

  final category = Category(
    id: id,
    isVisible: isVisible,
    techniqueIds: techniqueIds,
    title: title,
    description: description,
  );

  setUp(() {
    final categoryAdminRepository = serviceLocator<ICategoryAdminRepository>();
    reset(categoryAdminRepository);
  });

  test("[GetVisibleCategories] should return list of all hidden 'Category' entities when invoked.", () async {
    final categoryAdminRepository = serviceLocator<ICategoryAdminRepository>();
    final getVisibleCategories = serviceLocator<GetVisibleCategories>();
    when(() => categoryAdminRepository.getVisibleCategories()).thenAnswer((_) async => [category]);

    final res = await getVisibleCategories();

    expect(res, [category]);
  });
}
