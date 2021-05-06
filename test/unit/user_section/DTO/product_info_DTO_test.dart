import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/features/user_section/domain/entities/product_info.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/product_info_DTO.dart';

void main() {
  final price = "99 USD";

  test("[fromEntity] should return 'ProductInfoDTO' when entity object is provided.", () async {
    final productInfo1 = ProductInfo(ProductType.free);
    final productInfo2 = ProductInfo(ProductType.unavailable);
    final productInfo3 = ProductInfo(ProductType.available, price: price);

    final res1 = ProductInfoDTO.fromEntity(productInfo1);
    final res2 = ProductInfoDTO.fromEntity(productInfo2);
    final res3 = ProductInfoDTO.fromEntity(productInfo3);

    expect(res1.type, ProductType.free);
    expect(res2.type, ProductType.unavailable);
    expect(res3.type, ProductType.available);
    expect(res3.price != null, true);
    expect(res3.price, price);
  });

  test("[toJson] should return json format map when invoked.", () async {
    final productInfo1 = ProductInfoDTO(ProductType.free);
    final productInfo2 = ProductInfoDTO(ProductType.unavailable);
    final productInfo3 = ProductInfoDTO(ProductType.available, price: price);

    final res1 = productInfo1.toJson();
    final res2 = productInfo2.toJson();
    final res3 = productInfo3.toJson();

    expect(res1["type"], ProductType.free.index);
    expect(res2["type"], ProductType.unavailable.index);
    expect(res3["type"], ProductType.available.index);
    expect(res1["price"] == null, true);
    expect(res2["price"] == null, true);
    expect(res3["price"] == null, false);
    expect(res3["price"], price);
  });

  test("[fromJson] should return 'ProductInfoDTO' when given a Map.", () async {
    final json1 = {"type": ProductType.free.index};
    final json2 = {"type": ProductType.unavailable.index};
    final json3 = {"type": ProductType.available.index, "price": price};

    final res1 = ProductInfoDTO.fromJson(json1);
    final res2 = ProductInfoDTO.fromJson(json2);
    final res3 = ProductInfoDTO.fromJson(json3);

    expect(res1.type, ProductType.free);
    expect(res2.type, ProductType.unavailable);
    expect(res3.type, ProductType.available);
    expect(res1.price == null, true);
    expect(res2.price == null, true);
    expect(res3.price == null, false);
    expect(res3.price, price);
  });
}
