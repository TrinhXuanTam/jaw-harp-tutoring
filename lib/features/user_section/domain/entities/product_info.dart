/// Product information entity.
class ProductInfo {
  final ProductType type;
  final String? price;

  ProductInfo(this.type, {this.price});

  @override
  String toString() {
    switch (type) {
      case ProductType.free:
        return "Free";
      case ProductType.unavailable:
        return "Unavailable";
      case ProductType.available:
        return this.price!;
    }
  }
}

enum ProductType {
  free,
  unavailable,
  available,
}
