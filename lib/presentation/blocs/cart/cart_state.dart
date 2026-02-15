import 'package:equatable/equatable.dart';
import 'package:myapp/domain/entities/cart_entity.dart';
import 'package:myapp/domain/entities/product_entity.dart';

enum CartStatus { initial, loading, success, empty, error }

class CartState extends Equatable {
  final CartStatus status;
  final int id;
  final int quantity;
  final String errorMessage;
  final List<ProductEntity> products;

  const CartState(
      {this.errorMessage = "",
      this.status = CartStatus.initial,
      this.id = 0,
      this.products = const [],
      this.quantity = 0});

  // final CartStatus status;
  // final int userId;
  // final List<ProductEntity> products;
  // final String errorMessage;
  //
  // const CartState({
  //   this.status = CartStatus.initial,
  //   this.userId = 0,
  //   this.products = const [],
  //   this.errorMessage = "",
  // });

  factory CartState.initial() => const CartState(
      errorMessage: "", status: CartStatus.initial, id: 0, quantity: 0, products: []);

  factory CartState.loading() => const CartState(
      errorMessage: "", status: CartStatus.loading, id: 0, quantity: 0);

  factory CartState.success(int id, int quantity, ProductEntity product) => CartState(
      errorMessage: "", status: CartStatus.success, id: id, quantity: quantity, products: [product]);

  factory CartState.error(String errorMsg) => CartState(
      errorMessage: errorMsg, status: CartStatus.error, id: 0, quantity: 0);

  CartState copyWith({
    CartStatus? status,
    int? id,
    List<ProductEntity>? products,
    String? errorMessage,
  }) {
    return CartState(
      status: status ?? this.status,
      id: id ?? this.id,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, id, quantity];
}

// import 'package:equatable/equatable.dart';
// import 'package:myapp/domain/entities/product_entity.dart';
//
// enum CartStatus { initial, loading, success, empty, error }
//
// class CartState extends Equatable {
//   final CartStatus status;
//   final int userId;
//   final List<ProductEntity> products;
//   final String errorMessage;
//
//   const CartState({
//     this.status = CartStatus.initial,
//     this.userId = 0,
//     this.products = const [],
//     this.errorMessage = "",
//   });
//
//   // Copy with method for easier state updates
//   CartState copyWith({
//     CartStatus? status,
//     int? userId,
//     List<ProductEntity>? products,
//     String? errorMessage,
//   }) {
//     return CartState(
//       status: status ?? this.status,
//       userId: userId ?? this.userId,
//       products: products ?? this.products,
//       errorMessage: errorMessage ?? this.errorMessage,
//     );
//   }
//
//   // Factories for convenience
//   factory CartState.initial() => const CartState();
//
//   factory CartState.loading() => const CartState(status: CartStatus.loading);
//
//   factory CartState.success(int userId, List<ProductEntity> products) =>
//       CartState(
//         status: CartStatus.success,
//         userId: userId,
//         products: products,
//       );
//
//   factory CartState.empty() => const CartState(status: CartStatus.empty);
//
//   factory CartState.error(String errorMsg) =>
//       CartState(status: CartStatus.error, errorMessage: errorMsg);
//
//   @override
//   List<Object?> get props => [status, userId, products, errorMessage];
// }
