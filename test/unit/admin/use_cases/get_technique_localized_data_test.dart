import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/language_codes.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/admin/application/use_cases/get_technique_localized_data.dart';
import 'package:jews_harp/features/admin/domain/domain/technique_localized_data.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: ITechniqueAdminRepository, env: [GET_TECHNIQUE_LOCALIZED_DATA_TEST_ENV])
class TechniqueAdminRepository extends Mock implements ITechniqueAdminRepository {}

void main() {
  testConfigureDependencies(GET_TECHNIQUE_LOCALIZED_DATA_TEST_ENV);

  final languageCode = ENGLISH_CODE;
  final id = "id";
  final title = "title";
  final description = "description";
  final accompanyingTest = "accompanying test";

  final localizedData = TechniqueLocalizedData(
    languageCode: languageCode,
    title: title,
    description: description,
    accompanyingText: accompanyingTest,
  );

  setUp(() {
    final techniqueAdminRepository = serviceLocator<ITechniqueAdminRepository>();
    reset(techniqueAdminRepository);
  });

  test("[GetAllTechniques] should return localized data of a given Technique' when invoked.", () async {
    final techniqueAdminRepository = serviceLocator<ITechniqueAdminRepository>();
    final getTechniqueLocalizedData = serviceLocator<GetTechniqueLocalizedData>();
    when(() => techniqueAdminRepository.getLocalizedData(id)).thenAnswer((_) async => {languageCode: localizedData});

    final res = await getTechniqueLocalizedData(id);

    expect(res, {languageCode: localizedData});
  });
}
