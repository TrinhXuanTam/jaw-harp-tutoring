import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/admin/application/use_cases/update_category.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:mocktail/mocktail.dart';
import 'package:optional/optional.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: ICategoryAdminRepository, env: [UPDATE_CATEGORY_TEST_ENV])
class CategoryAdminRepository extends Mock implements ICategoryAdminRepository {}

void main() {
  testConfigureDependencies(UPDATE_CATEGORY_TEST_ENV);

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

  test("[UpdateCategory] should return 'Category' entity when category is successfully updated.", () async {
    final categoryAdminRepository = serviceLocator<ICategoryAdminRepository>();
    final createCategory = serviceLocator<UpdateCategory>();
    when(
      () => categoryAdminRepository.updateCategory(
        id: id,
        isVisible: isVisible,
        thumbnail: Optional.empty(),
        localizedData: any(named: "localizedData"),
      ),
    ).thenAnswer((_) async => category);

    final res = await createCategory(id: id, isVisible: isVisible, thumbnail: Optional.empty(), localizedData: []);

    expect(res, category);
  });
}
