// import 'package:myapp/data/source/add_to_cart.dart';
// import 'package:myapp/domain/entities/cart_entity.dart';
// import 'package:myapp/domain/repositories/cart_repo.dart';
//
// class CartRepoImpl extends CartRepo{
//
//   final CartRemoteDataSource data;
//   CartRepoImpl(this.data);
//
//   @override
//   Future<List<CartEntity>> cartItems() {
//
//     return data.getCart();
//   }
//
// }

import 'package:myapp/data/source/add_to_cart.dart';
import 'package:myapp/domain/entities/cart_entity.dart';
import 'package:myapp/domain/entities/product_entity.dart';
import 'package:myapp/domain/repositories/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final CartRemoteDataSource data;
  CartRepoImpl(this.data);

  @override
  Future<List<CartEntity>> cartItems() {
    return data.getCart();
  }

  @override
  Future<void> addToCart(int userId, ProductEntity product, int quantity) async {
    // Call remote data source to add product
    await data.addProductToCart(userId, product, quantity);
  }

  @override
  Future<void> removeFromCart(int userId, int productId) async {
    await data.removeProductFromCart(userId, productId);
  }

  @override
  Future<void> updateQuantity(int userId, int productId, int quantity) async {
    await data.updateProductQuantity(userId, productId, quantity);
  }
}
