import 'package:myapp/data/source/add_to_cart.dart';
import 'package:myapp/domain/entities/cart_entity.dart';
import 'package:myapp/domain/repositories/cart_repo.dart';

class CartRepoImpl extends CartRepo{

  final CartRemoteDataSource data;
  CartRepoImpl(this.data);

  @override
  Future<List<CartEntity>> cartItems() {

    return data.getCart();
  }

}