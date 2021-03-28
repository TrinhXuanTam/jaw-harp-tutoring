import 'package:jews_harp/features/user_section/domain/entities/product_info.dart';

class ProductInfoDTO extends ProductInfo {
  ProductInfoDTO({
    required String id,
    required String price,
  }) : super(id: id, price: price);

  factory ProductInfoDTO.fromEntity(ProductInfo productInfo) {
    return ProductInfoDTO(id: productInfo.id, price: productInfo.price);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "price": price,
    };
  }

  factory ProductInfoDTO.fromJson(Map<String, dynamic> json) {
    return ProductInfoDTO(
      id: json["id"],
      price: json["price"],
    );
  }
}
