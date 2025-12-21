import 'package:myapp/domain/entities/cart_entity.dart';

abstract class CartEvent {}

class InitEvent extends CartEvent {}

class AddToCart extends CartEvent {
  final int id;
  final int quantity;
  AddToCart(this.id, this.quantity);
}
class RemoveFromCart extends CartEvent {
  final CartEntity id;
  RemoveFromCart(this.id);
}
class UpdateQuantity extends CartEvent {
  final CartEntity quantity;
  UpdateQuantity(this.quantity);
}