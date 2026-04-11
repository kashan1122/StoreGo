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
import 'dart:convert';

import 'package:myapp/data/model/cart_model.dart';
import 'package:myapp/domain/entities/cart_entity.dart';
import 'package:myapp/domain/entities/product_entity.dart';
import 'package:http/http.dart' as http;

class CartRemoteDataSource {
  // Simulated in-memory cart storage
  final Map<int, List<CartEntity>> _carts = {}; // key = userId

  /// Fetch all items in the user's cart
  Future<List<CartEntity>> getCart({int userId = 1}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _carts[userId] ?? [];
  }

  /// Add a product to the cart
  // Future<void>
  addProductToCart(
      int userId, ProductEntity product, int quantity) async {
    try{
      print("object: $product");
      print("DATA source quantity: $quantity");
      var request = {
        "userId": userId,
        "date": DateTime.now().toString(),
        "products": [
          { "productId": product.id, "quantity": quantity},
        ]
      };
      final response = await http.post(
        Uri.parse("https://fakestoreapi.com/carts"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request),
      );
      // await Future.delayed(const Duration(milliseconds: 300));
      print("object cart DataSource body: ${response.body}");
      print("object cart DataSource status code: ${response.statusCode}");


      if(response.statusCode==201){
        var jsonDecoded = jsonDecode(response.body);
        var singleCartItem = jsonDecoded['products'];
        print("object123: ${jsonDecoded['products']}");
        return singleCartItem.map((e) => CartModel.fromJson(e)).toList();
      }
      // final cart = _carts[userId] ?? [];
      //
      // // Check if product already exists
      // final index = cart.indexWhere((c) => c.productId == product.id);
      // if (index != -1) {
      //   // Update quantity
      //   final existing = cart[index];
      //   cart[index] = CartEntity(
      //     productId: existing.productId,
      //     quantity: existing.quantity + quantity,
      //   );
      // } else {
      //   // Add new product
      //   cart.add(CartEntity(
      //     productId: product.id,
      //     quantity: quantity,
      //   ));
      // }
      //
      // _carts[userId] = cart;
      }catch(e){
      print("ERROR: $e");
      return e;
    }
  }

  /// Remove a product from the cart
  Future<void> removeProductFromCart(int userId, int productId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final cart = _carts[userId] ?? [];
    cart.removeWhere((c) => c.productId == productId);
    _carts[userId] = cart;
  }

  /// Update quantity of a product in the cart
  Future<void> updateProductQuantity(
      int userId, int productId, int quantity) async {
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
