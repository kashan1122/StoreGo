// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:myapp/presentation/blocs/cart/cart_event.dart';
// import 'package:myapp/presentation/blocs/cart/cart_state.dart';
//
// class CartBloc extends Bloc<CartEvent, CartState> {
//   final repository;
//
//   CartBloc(this.repository) : super(const CartState()) {
//     on<InitEvent>((event, emit) async {});
//     on<AddToCart>((event, emit) async {
//       print("Items adding into cart");
//     });
//     on<RemoveFromCart>((event, emit) async {});
//     on<UpdateQuantity>((event, emit) async {});
//   }
// }


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/domain/entities/cart_entity.dart';
import 'package:myapp/domain/entities/product_entity.dart';
import 'package:myapp/presentation/blocs/cart/cart_event.dart';
import 'package:myapp/presentation/blocs/cart/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final repository;

  CartBloc(this.repository) : super(const CartState()) {
    on<InitEvent>((event, emit) async {
      // Load initial cart from repository if needed
      final cart = await repository.getCart();
      emit(state.copyWith(
        userId: cart.userId,
        products: cart.products,
      ));
    });

    on<AddToCart>((event, emit) async {
      print("Adding item to cart: ${event.product.title}");

      // Check if product already exists in cart
      final existingIndex = state.products.indexWhere((p) => p.id == event.product.id);


      List<ProductEntity> updatedProducts = List.from(state.products);
      print("object123: $updatedProducts");

      print("AA: $existingIndex");
      if (existingIndex != -1) {
        // If exists, increase quantity
        final existingProduct = updatedProducts[existingIndex];
        updatedProducts[existingIndex] = ProductEntity(
          id: existingProduct.id,
          title: existingProduct.title,
          price: existingProduct.price,
          description: existingProduct.description,
          category: existingProduct.category,
          image: existingProduct.image,
          // quantity: existingProduct.quantity + event.quantity,
        );
      } else {
        // Add new product
        updatedProducts.add(ProductEntity(
          id: event.product.id,
          title: event.product.title,
          price: event.product.price,
          description: event.product.description,
          category: event.product.category,
          image: event.product.image,
          // quantity: event.quantity,
        ));
      }

      emit(state.copyWith(products: updatedProducts));
    });

    on<RemoveFromCart>((event, emit) async {
      final updatedProducts = state.products.where((p) => p.id != event.productId).toList();
      emit(state.copyWith(products: updatedProducts));
    });

    on<UpdateQuantity>((event, emit) async {
      final index = state.products.indexWhere((p) => p.id == event.productId);
      if (index != -1) {
        List<ProductEntity> updatedProducts = List.from(state.products);
        final product = updatedProducts[index];
        updatedProducts[index] = ProductEntity(
          id: product.id,
          title: product.title,
          price: product.price,
          description: product.description,
          category: product.category,
          image: product.image,
          // quantity: event.quantity,
        );
        emit(state.copyWith(products: updatedProducts));
      }
    });
  }
}

