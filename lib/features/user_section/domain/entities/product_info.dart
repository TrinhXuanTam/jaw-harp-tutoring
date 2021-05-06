import 'package:equatable/equatable.dart';

/// Product information entity.
class ProductInfo extends Equatable {
  /// Type of the product.
  /// Can be either free, available or temporarily unavailable.
  final ProductType type;
  final String? price;

  ProductInfo(this.type, {this.price});

  /// Get the string representation of the product info.
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

  @override
  List<Object?> get props => [type, price];
}

enum ProductType {
  free,
  unavailable,
  available,
}
