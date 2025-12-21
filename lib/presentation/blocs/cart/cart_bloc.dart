import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/presentation/blocs/cart/cart_event.dart';
import 'package:myapp/presentation/blocs/cart/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final repository;

  CartBloc(this.repository) : super(const CartState()) {
    on<InitEvent>((event, emit) async {});
    on<AddToCart>((event, emit) async {
      print("Items adding into cart");
    });
    on<RemoveFromCart>((event, emit) async {});
    on<UpdateQuantity>((event, emit) async {});
  }
}
