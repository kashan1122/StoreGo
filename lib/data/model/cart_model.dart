
import 'package:myapp/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({
    required super.productId,
    required super.quantity,

  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productId: json['productId'],
      quantity: json['quantity']
    );
  }

  CartEntity toEntity() {
    return CartEntity(
        productId: productId,
        quantity: quantity);
  }
}
