import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/facade_interfaces/user_section_facade.dart';
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart';
import 'package:jews_harp/features/user_section/infrastructure/external_services/payment_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:optional/optional.dart';

import '../../../dependency_injection/test_service_locator.dart';

@injectable.LazySingleton(as: PaymentService, env: [USER_SECTION_FACADE_TEST_ENV])
class PaymentServiceMock extends Mock implements PaymentService {}

@injectable.LazySingleton(as: FirebaseUserSectionDataSource, env: [USER_SECTION_FACADE_TEST_ENV])
class FirebaseUserSectionDataSourceMock extends Mock implements FirebaseUserSectionDataSource {}

class TechniqueMock extends Mock implements Technique {}

void main() {
  testConfigureDependencies(USER_SECTION_FACADE_TEST_ENV);

  var techniqueMock;
  final techniqueId = "id";
  final productId = Optional.of("productId");

  // Reset mock objects before each test.
  setUp(() {
    final paymentServiceMock = serviceLocator<PaymentService>();
    final firebaseUserSectionDataSourceMock = serviceLocator<FirebaseUserSectionDataSource>();
    techniqueMock = TechniqueMock();

    reset(paymentServiceMock);
    reset(firebaseUserSectionDataSourceMock);
  });

  test("[markTechniqueAsFavorite] should mark technique as favorite when invoked.", () async {
    var isFavorite = false;
    final userSectionFacade = serviceLocator<IUserSectionFacade>();
    final firebaseUserSectionDataSourceMock = serviceLocator<FirebaseUserSectionDataSource>();
    when(() => firebaseUserSectionDataSourceMock.markTechniqueAsFavorite(techniqueId)).thenAnswer((_) async => isFavorite = true);

    await userSectionFacade.markTechniqueAsFavorite(techniqueId);

    expect(isFavorite, true);
  });

  test("[removeTechniqueFromFavorites] should remove technique from favorites when invoked.", () async {
    var isFavorite = true;
    final userSectionFacade = serviceLocator<IUserSectionFacade>();
    final firebaseUserSectionDataSourceMock = serviceLocator<FirebaseUserSectionDataSource>();
    when(() => firebaseUserSectionDataSourceMock.removeTechniqueFromFavorites(techniqueId)).thenAnswer((_) async => isFavorite = false);

    await userSectionFacade.removeTechniqueFromFavorites(techniqueId);

    expect(isFavorite, false);
  });

  test("[purchaseTechnique] should purchase the technique and save to firebase when invoke.", () async {
    var isPurchased = false;
    var isSavedToFirestore = false;
    final userSectionFacade = serviceLocator<IUserSectionFacade>();
    final paymentServiceMock = serviceLocator<PaymentService>();
    final firebaseUserSectionDataSourceMock = serviceLocator<FirebaseUserSectionDataSource>();
    when(() => techniqueMock.productId).thenReturn(productId);
    when(() => techniqueMock.id).thenReturn(techniqueId);
    when(() => paymentServiceMock.purchaseTechnique(productId.value)).thenAnswer((_) async => isPurchased = true);
    when(() => firebaseUserSectionDataSourceMock.addPurchasedTechnique(techniqueId)).thenAnswer((_) async => isSavedToFirestore = true);

    await userSectionFacade.purchaseTechnique(techniqueMock);

    expect(isPurchased, true);
    expect(isSavedToFirestore, true);
  });
}
