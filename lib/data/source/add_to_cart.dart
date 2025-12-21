import 'package:myapp/domain/entities/cart_entity.dart';

class CartRemoteDataSource {
  /// Hardcoded response (API not available)
  Future<List<CartEntity>>getCart() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [const CartEntity(
        productId: 3,
        quantity: 3,
      )];
  }
}
