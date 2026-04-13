//
// import 'package:myapp/domain/entities/cart_entity.dart';
//
// class CartModel extends CartEntity {
//   CartModel({
//     required super.productId,
//     required super.quantity,
//   });
//
//   factory CartModel.fromJson(Map<String, dynamic> json) {
//     print("object from Cart Model: $json");
//     return CartModel(
//       productId: json["productId"],
//       quantity: json["quantity"]
//     );
//   }
//
//   CartEntity toEntity() {
//     return CartEntity(
//         productId: productId,
//         quantity: quantity);
//   }
// }

import 'package:myapp/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  final String? title;
  final double? price;
  final double? total;
  final double? discountPercentage;
  final double? discountedPrice;
  final String? thumbnail;

  CartModel({
    required int productId,
    required int quantity,
    this.title,
    this.price,
    this.total,
    this.discountPercentage,
    this.discountedPrice,
    this.thumbnail,
  }) : super(
    productId: productId,
    quantity: quantity,
  );

  factory CartModel.fromJson(Map<String, dynamic> json) {
    print("object from Cart Model: $json");

    return CartModel(
      // ✅ DummyJSON uses "id" instead of "productId"
      productId: json["id"],
      quantity: json["quantity"],
      // ✅ extra fields (optional but useful)
      title: json["title"],
      price: (json["price"] as num?)?.toDouble(),
      total: (json["total"] as num?)?.toDouble(),
      discountPercentage:
      (json["discountPercentage"] as num?)?.toDouble(),
      discountedPrice:
      (json["discountedPrice"] as num?)?.toDouble(),
      thumbnail: json["thumbnail"],
    );
  }

  CartEntity toEntity() {
    return CartEntity(
      productId: productId,
      quantity: quantity,
    );
  }
}