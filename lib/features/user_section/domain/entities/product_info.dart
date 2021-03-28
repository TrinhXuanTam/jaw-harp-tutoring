import 'package:equatable/equatable.dart';

class ProductInfo extends Equatable {
  final String id;
  final String price;

  ProductInfo({
    required this.id,
    required this.price,
  });

  @override
  List<Object?> get props => [id, price];
}
