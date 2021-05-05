import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/admin/application/use_cases/create_technique.dart';
import 'package:jews_harp/features/admin/domain/repository_interfaces/technique_admin_repository.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/domain/entities/product_info.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:mocktail/mocktail.dart';
import 'package:optional/optional.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: ITechniqueAdminRepository, env: [CREATE_TECHNIQUE_TEST_ENV])
class TechniqueAdminRepository extends Mock implements ITechniqueAdminRepository {}

void main() {
  testConfigureDependencies(CREATE_TECHNIQUE_TEST_ENV);

  final id = "id";
  final title = "title";
  final description = "description";
  final accompanyingTest = "accompanying test";
  final difficulty = TechniqueDifficulty.beginner;
  final productInfo = ProductInfo(ProductType.free);
  final productId = Optional<String>.empty();
  final thumbnail = Optional<Media>.empty();
  final video = Optional<Media>.empty();
  final category = Category(
    id: "categoryId",
    isVisible: true,
    techniqueIds: [id],
    title: "categoryTitle",
    description: "categoryDescription",
  );

  final technique = Technique(
    id: id,
    title: title,
    productId: productId,
    description: description,
    accompanyingText: accompanyingTest,
    difficulty: difficulty,
    productInfo: productInfo,
    category: category,
    thumbnail: thumbnail,
    video: video,
  );

  setUp(() {
    final techniqueAdminRepository = serviceLocator<ITechniqueAdminRepository>();
    reset(techniqueAdminRepository);
  });

  test("[CreateTechnique] should return 'Technique' entity when technique is successfully created.", () async {
    final techniqueAdminRepository = serviceLocator<ITechniqueAdminRepository>();
    final createTechnique = serviceLocator<CreateTechnique>();
    when(
      () => techniqueAdminRepository.createTechnique(
        video: video,
        difficulty: difficulty,
        thumbnail: thumbnail,
        categoryId: category.id,
        localizedData: any(named: "localizedData"),
        productId: productId,
      ),
    ).thenAnswer((_) async => technique);

    final res = await createTechnique(
      productId: productId,
      categoryId: category.id,
      difficulty: difficulty,
      localizedData: [],
      thumbnail: thumbnail,
      video: video,
    );

    expect(res, technique);
  });
}
