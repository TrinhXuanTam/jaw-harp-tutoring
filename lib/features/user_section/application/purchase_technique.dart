import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/errors/product_not_available.dart';
import 'package:jews_harp/features/user_section/domain/entities/product_info.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/facade_interfaces/user_section_facade.dart';

/// Purchase a technique of given [productId].
@LazySingleton(env: [Environment.prod, Environment.dev, PURCHASE_TECHNIQUE_TEST_ENV])
class PurchaseTechnique {
  final IUserSectionFacade _userSectionFacade;

  PurchaseTechnique(this._userSectionFacade);

  Future<void> call(Technique technique) async {
    final productType = technique.productInfo.type;

    if (productType != ProductType.available) throw ProductNotAvailableError();

    _userSectionFacade.purchaseTechnique(technique);
  }
}
