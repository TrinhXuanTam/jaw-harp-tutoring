import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/admin/application/use_cases/get_hidden_categories.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: ICategoryAdminRepository, env: [GET_HIDDEN_CATEGORIES_TEST_ENV])
class CategoryAdminRepository extends Mock implements ICategoryAdminRepository {}

void main() {
  testConfigureDependencies(GET_HIDDEN_CATEGORIES_TEST_ENV);

  final id = "id";
  final isVisible = false;
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

  test("[GetHiddenCategories] should return list of all hidden 'Category' entities when invoked.", () async {
    final categoryAdminRepository = serviceLocator<ICategoryAdminRepository>();
    final getHiddenCategories = serviceLocator<GetHiddenCategories>();
    when(() => categoryAdminRepository.getHiddenCategories()).thenAnswer((_) async => [category]);

    final res = await getHiddenCategories();

    expect(res, [category]);
  });
}
