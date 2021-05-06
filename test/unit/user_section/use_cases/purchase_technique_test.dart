import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/errors/product_not_available.dart';
import 'package:jews_harp/features/user_section/application/purchase_technique.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/product_info.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/facade_interfaces/user_section_facade.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: IUserSectionFacade, env: [PURCHASE_TECHNIQUE_TEST_ENV])
class UserSectionFacadeMock extends Mock implements IUserSectionFacade {}

void main() {
  testConfigureDependencies(PURCHASE_TECHNIQUE_TEST_ENV);

  // Reset mock objects before each test.
  setUp(() {
    final userSectionFacadeMock = serviceLocator<IUserSectionFacade>();
    reset(userSectionFacadeMock);
  });

  test("[PurchaseTechnique] should purchase the technique when invoked.", () async {
    final category = Category(
      id: "categoryId",
      isVisible: true,
      techniqueIds: ["technique"],
      title: "title",
      description: "description",
    );
    final technique = Technique(
      id: "technique",
      title: "title",
      category: category,
      difficulty: TechniqueDifficulty.beginner,
      productInfo: ProductInfo(ProductType.available, price: "99 USD"),
      description: "description",
      accompanyingText: "accompanyingText",
    );
    var techniquePurchased = false;
    final purchaseTechnique = serviceLocator<PurchaseTechnique>();
    final userSectionFacadeMock = serviceLocator<IUserSectionFacade>();
    when(() => userSectionFacadeMock.purchaseTechnique(technique)).thenAnswer((_) async => techniquePurchased = true);

    await purchaseTechnique(technique);

    expect(techniquePurchased, true);
  });

  test("[PurchaseTechnique] should throw 'ProductNotAvailableError' when technique is for free.", () async {
    final category = Category(
      id: "categoryId",
      isVisible: true,
      techniqueIds: ["technique"],
      title: "title",
      description: "description",
    );
    final technique = Technique(
      id: "technique",
      title: "title",
      category: category,
      difficulty: TechniqueDifficulty.beginner,
      productInfo: ProductInfo(ProductType.free),
      description: "description",
      accompanyingText: "accompanyingText",
    );
    var techniquePurchased = false;
    final purchaseTechnique = serviceLocator<PurchaseTechnique>();
    final userSectionFacadeMock = serviceLocator<IUserSectionFacade>();
    when(() => userSectionFacadeMock.purchaseTechnique(technique)).thenAnswer((_) async => techniquePurchased = true);

    expect(purchaseTechnique(technique), throwsA(isInstanceOf<ProductNotAvailableError>()));
    expect(techniquePurchased, false);
  });

  test("[PurchaseTechnique] should throw 'ProductNotAvailableError' when technique is not available.", () async {
    final category = Category(
      id: "categoryId",
      isVisible: true,
      techniqueIds: ["technique"],
      title: "title",
      description: "description",
    );
    final technique = Technique(
      id: "technique",
      title: "title",
      category: category,
      difficulty: TechniqueDifficulty.beginner,
      productInfo: ProductInfo(ProductType.unavailable),
      description: "description",
      accompanyingText: "accompanyingText",
    );
    var techniquePurchased = false;
    final purchaseTechnique = serviceLocator<PurchaseTechnique>();
    final userSectionFacadeMock = serviceLocator<IUserSectionFacade>();
    when(() => userSectionFacadeMock.purchaseTechnique(technique)).thenAnswer((_) async => techniquePurchased = true);

    expect(purchaseTechnique(technique), throwsA(isInstanceOf<ProductNotAvailableError>()));
    expect(techniquePurchased, false);
  });
}
