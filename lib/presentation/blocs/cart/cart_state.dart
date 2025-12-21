import 'package:equatable/equatable.dart';
import 'package:myapp/domain/entities/cart_entity.dart';

enum CartStatus { initial, loading, success, empty, error }

class CartState extends Equatable {
  final CartStatus status;
  final int id;
  final int quantity;
  final String errorMessage;

  const CartState(
      {this.errorMessage = "",
      this.status = CartStatus.initial,
      this.id = 0,
      this.quantity = 0});

  factory CartState.initial() => const CartState(
      errorMessage: "", status: CartStatus.initial, id: 0, quantity: 0);

  factory CartState.loading() => const CartState(
      errorMessage: "", status: CartStatus.loading, id: 0, quantity: 0);

  factory CartState.success(int id, int quantity) => CartState(
      errorMessage: "", status: CartStatus.success, id: id, quantity: quantity);

  factory CartState.error(String errorMsg) => CartState(
      errorMessage: errorMsg, status: CartStatus.error, id: 0, quantity: 0);

  @override
  List<Object?> get props => [status, id, quantity];
}
