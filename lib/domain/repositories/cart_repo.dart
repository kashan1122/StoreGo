import 'package:myapp/domain/entities/cart_entity.dart';

abstract class CartRepo {
  Future<List<CartEntity>> cartItems();
}