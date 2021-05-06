import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/language_codes.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/admin/application/use_cases/get_category_localized_data.dart';
import 'package:jews_harp/features/admin/domain/domain/category_localized_data.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/category_admin_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: ICategoryAdminRepository, env: [GET_CATEGORY_LOCALIZED_DATA_TEST_ENV])
class CategoryAdminRepository extends Mock implements ICategoryAdminRepository {}

void main() {
  testConfigureDependencies(GET_CATEGORY_LOCALIZED_DATA_TEST_ENV);

  final id = "id";
  final languageCode = ENGLISH_CODE;
  final title = "title";
  final description = "description";

  final localizedData = CategoryLocalizedData(
    languageCode: languageCode,
    title: title,
    description: description,
  );

  setUp(() {
    final categoryAdminRepository = serviceLocator<ICategoryAdminRepository>();
    reset(categoryAdminRepository);
  });

  test("[GetCategoryLocalizedData] should return localization data for given category when invoked.", () async {
    final categoryAdminRepository = serviceLocator<ICategoryAdminRepository>();
    final getCategoryLocalizedData = serviceLocator<GetCategoryLocalizedData>();
    when(() => categoryAdminRepository.getLocalizedData(id)).thenAnswer((_) async => {languageCode: localizedData});

    final res = await getCategoryLocalizedData(id);

    expect(res, {languageCode: localizedData});
  });
}
