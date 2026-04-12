// import 'package:myapp/data/source/cart_remote_data.dart';
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

import 'package:myapp/data/source/cart_remote_data.dart';
import 'package:myapp/domain/entities/cart_entity.dart';
import 'package:myapp/domain/entities/product_entity.dart';
import 'package:myapp/domain/repositories/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;
  CartRepoImpl(this.cartRemoteDataSource);

  @override
  Future<List<ProductEntity>> cartItems() async{
    var result = await cartRemoteDataSource.getCart(userId: 1);

    return result;
  }

  @override
  Future<ProductEntity> addToCart(int userId, ProductEntity product, int quantity) async {
    // Call remote data source to add product
    print("ADD TO CART FROM REPO IMPL: $quantity");
    var result = await cartRemoteDataSource.addProductToCart(userId, product, quantity);
    print("ADD TO CART FROM REPO IMPL re: ${result[0].title}");

     return result as ProductEntity;
  }

  @override
  Future<void> removeFromCart(int userId, int productId) async {
    await cartRemoteDataSource.removeProductFromCart(userId, productId);
  }

  @override
  Future<void> updateQuantity(int userId, int productId, int quantity) async {
    await cartRemoteDataSource.updateProductQuantity(userId, productId, quantity);
  }
}
