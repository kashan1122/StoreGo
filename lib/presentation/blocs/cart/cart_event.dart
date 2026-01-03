// import 'package:myapp/domain/entities/cart_entity.dart';
//
// abstract class CartEvent {}
//
// class InitEvent extends CartEvent {}
//
// class AddToCart extends CartEvent {
//   final int id;
//   final int quantity;
//   AddToCart(this.id, this.quantity);
// }
// class RemoveFromCart extends CartEvent {
//   final CartEntity id;
//   RemoveFromCart(this.id);
// }
// class UpdateQuantity extends CartEvent {
//   final CartEntity quantity;
//   UpdateQuantity(this.quantity);
// }
import 'package:myapp/domain/entities/cart_entity.dart';
import 'package:myapp/domain/entities/product_entity.dart';

abstract class CartEvent {}

class InitEvent extends CartEvent {}

class AddToCart extends CartEvent {
  final int userId;
  final ProductEntity product;
  final int quantity;

  AddToCart({
    required this.userId,
    required this.product,
    required this.quantity,
  });
}

class RemoveFromCart extends CartEvent {
  final int userId;
  final int productId;

  RemoveFromCart({
    required this.userId,
    required this.productId,
  });
}

class UpdateQuantity extends CartEvent {
  final int userId;
  final int productId;
  final int quantity;

  UpdateQuantity({
    required this.userId,
    required this.productId,
    required this.quantity,
  });
}
