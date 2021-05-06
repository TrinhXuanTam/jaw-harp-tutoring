import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/user_section/application/download_technique.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/product_info.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/technique_repository.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/mediaDTO.dart';
import 'package:mocktail/mocktail.dart';
import 'package:optional/optional.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: ITechniqueRepository, env: [DOWNLOAD_TECHNIQUE_TEST_ENV])
class TechniqueRepositoryMock extends Mock implements ITechniqueRepository {}

void main() {
  testConfigureDependencies(DOWNLOAD_TECHNIQUE_TEST_ENV);

  final id = "id";
  final productId = Optional<String>.empty();
  final productInfo = ProductInfo(ProductType.free);
  final categoryDTO = Category(
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

  final technique = Technique(
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
    final techniqueRepositoryMock = serviceLocator<ITechniqueRepository>();
    reset(techniqueRepositoryMock);
  });

  test("[DownloadTechnique] should return downloaded technique entity when technique was successfully downloaded", () async {
    var techniqueDownloaded = false;
    final downloadTechnique = serviceLocator<DownloadTechnique>();
    final techniqueRepositoryMock = serviceLocator<ITechniqueRepository>();
    when(() => techniqueRepositoryMock.downloadTechnique(id)).thenAnswer((_) async {
      techniqueDownloaded = true;
      return technique;
    });

    final res = await downloadTechnique(id);

    expect(techniqueDownloaded, true);
    expect(res, technique);
  });
}
