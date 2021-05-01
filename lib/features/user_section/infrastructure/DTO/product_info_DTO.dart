import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:jews_harp/features/user_section/domain/entities/product_info.dart';

/// DTO for loading product information.
class ProductInfoDTO extends ProductInfo {
  ProductInfoDTO(ProductType type, {String? price}) : super(type, price: price);

  /// Create DTO from entity.
  factory ProductInfoDTO.fromEntity(ProductInfo productInfo) {
    return ProductInfoDTO(
      productInfo.type,
      price: productInfo.price,
    );
  }

  /// Connect to App Store or Google Play and try to fetch product information.
  static Future<ProductInfoDTO> fromProductId(String? productId) async {
    final iapConnection = InAppPurchaseConnection.instance;

    // No [productId] provided, therefore it's free.
    if (productId == null)
      return ProductInfoDTO(ProductType.free);
    else {
      // Store is not available temporarily.
      if (!(await iapConnection.isAvailable())) {
        return ProductInfoDTO(ProductType.unavailable);
      }

      final productDetails = await iapConnection.queryProductDetails({productId});
      if (productDetails.productDetails.isEmpty)
        // Product is not registered yet.
        return ProductInfoDTO(ProductType.unavailable);
      else
        // Product is available.
        return ProductInfoDTO(ProductType.available, price: productDetails.productDetails.first.price);
    }
  }

  /// Convert DTO to json format.
  Map<String, dynamic> toJson() {
    return {
      "type": type.index,
      if (this.type == ProductType.available) "price": this.price!,
    };
  }

  /// Load DTO from json format
  factory ProductInfoDTO.fromJson(Map<String, dynamic> json) {
    final type = ProductType.values[json["type"] as int];
    String? price;

    // Load price if product is available.
    if (type == ProductType.available) price = json["price"];

    return ProductInfoDTO(type, price: price);
  }
}
