import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/product_not_available.dart';
import 'package:jews_harp/core/errors/purchase_failed_error.dart';

@LazySingleton(env: [Environment.prod])
class PaymentService {
  final InAppPurchaseConnection _purchaseConnection = InAppPurchaseConnection.instance;

  Future<void> purchaseTechnique(String productId) async {
    final productDetails = await _purchaseConnection.queryProductDetails({productId});

    if (productDetails.notFoundIDs.isNotEmpty) throw ProductNotAvailableError();

    final purchaseSuccessful = await _purchaseConnection.buyConsumable(
      purchaseParam: PurchaseParam(productDetails: productDetails.productDetails.first),
    );

    if (!purchaseSuccessful) throw PurchaseFailedError();
  }
}
