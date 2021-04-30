/// Product information entity.
class ProductInfo {
  final ProductType type;
  final String? price;

  ProductInfo(this.type, {this.price});
}

enum ProductType {
  free,
  unavailable,
  available,
}
