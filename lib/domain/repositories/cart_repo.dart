// import 'package:myapp/domain/entities/cart_entity.dart';
//
// abstract class CartRepo {
//   Future<List<CartEntity>> cartItems();
// }
import 'package:myapp/domain/entities/cart_entity.dart';
import 'package:myapp/domain/entities/product_entity.dart';

abstract class CartRepo {
  /// Fetch all items in the cart
  Future<List<CartEntity>> cartItems();

  /// Add a product to the cart
  Future<void> addToCart(int userId, ProductEntity product, int quantity);

  /// Remove a product from the cart
  Future<void> removeFromCart(int userId, int productId);

  /// Update quantity of a product in the cart
  Future<void> updateQuantity(int userId, int productId, int quantity);
}

