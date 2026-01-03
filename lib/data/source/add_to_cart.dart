// import 'package:myapp/domain/entities/cart_entity.dart';
//
// class CartRemoteDataSource {
//   /// Hardcoded response (API not available)
//   Future<List<CartEntity>>getCart() async {
//     await Future.delayed(const Duration(milliseconds: 500));
//     return [const CartEntity(
//         productId: 3,
//         quantity: 3,
//       )];
//   }
// }
import 'package:myapp/domain/entities/cart_entity.dart';
import 'package:myapp/domain/entities/product_entity.dart';

class CartRemoteDataSource {
  // Simulated in-memory cart storage
  final Map<int, List<CartEntity>> _carts = {}; // key = userId

  /// Fetch all items in the user's cart
  Future<List<CartEntity>> getCart({int userId = 1}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _carts[userId] ?? [];
  }

  /// Add a product to the cart
  Future<void> addProductToCart(int userId, ProductEntity product, int quantity) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final cart = _carts[userId] ?? [];

    // Check if product already exists
    final index = cart.indexWhere((c) => c.productId == product.id);
    if (index != -1) {
      // Update quantity
      final existing = cart[index];
      cart[index] = CartEntity(
        productId: existing.productId,
        quantity: existing.quantity + quantity,
      );
    } else {
      // Add new product
      cart.add(CartEntity(
        productId: product.id,
        quantity: quantity,
      ));
    }

    _carts[userId] = cart;
  }

  /// Remove a product from the cart
  Future<void> removeProductFromCart(int userId, int productId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final cart = _carts[userId] ?? [];
    cart.removeWhere((c) => c.productId == productId);
    _carts[userId] = cart;
  }

  /// Update quantity of a product in the cart
  Future<void> updateProductQuantity(int userId, int productId, int quantity) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final cart = _carts[userId] ?? [];
    final index = cart.indexWhere((c) => c.productId == productId);
    if (index != -1) {
      cart[index] = CartEntity(
        productId: cart[index].productId,
        quantity: quantity,
      );
    }
    _carts[userId] = cart;
  }
}
