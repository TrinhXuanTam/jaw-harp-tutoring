abstract class ProductInfo {}

class FreeProduct extends ProductInfo {}

class UnavailableProduct extends ProductInfo {}

class AvailableProduct extends ProductInfo {
  final String id;
  final String price;

  AvailableProduct({
    required this.id,
    required this.price,
  });
}
