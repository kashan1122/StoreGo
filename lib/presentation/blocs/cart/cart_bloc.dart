import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/data/repositories/remote/cart_repo_impl.dart';
import 'package:myapp/domain/entities/product_entity.dart';
import 'package:myapp/domain/repositories/cart_repo.dart';
import 'package:myapp/presentation/blocs/cart/cart_event.dart';
import 'package:myapp/presentation/blocs/cart/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepo repository;

  CartBloc(this.repository) : super(const CartState()) {
    on<InitEvent>((event, emit) async {});
    on<AddToCart>((event, emit) async {
      ProductEntity copyEvent = event.product;
      int copyEventQuan = event.quantity;

      // Map<String, dynamic> addToCartProduct =
      // {
      // "id": copyEvent.id,
      // "title": copyEvent.title,
      // "price": copyEvent.price,
      // "description": copyEvent.description,
      // "category": copyEvent.category,
      // "image": copyEvent.image
      // };
      ProductEntity addToCartProduct =  ProductEntity(
        id: copyEvent.id,
        title: copyEvent.title,
        price: copyEvent.price,
        description: copyEvent.description,
        category: copyEvent.category,
        image: copyEvent.image,
      );
      try {
        final items = await repository.addToCart(1, addToCartProduct, copyEventQuan);
        print("ITEMS: $items");
        emit(state.copyWith(
          // status: items.toString().isNull ? CartStatus.empty : CartStatus.success,
          status: CartStatus.success,
          products: [items],
          id: 1,
          errorMessage: ""
        ),);
      } catch (e) {
        emit(state.copyWith(
            status: CartStatus.error,
            products: [],
            id: 1,
            errorMessage: "Proceed Error"
        ));
      }

    });


    // on<GetCart>((event, emit) async {
    //   try {
    //     final items = await repository.cartItems();
    //     print("ITEMS: $items");
    //     emit(state.copyWith(
    //       // status: items.toString().isNull ? CartStatus.empty : CartStatus.success,
    //       status: CartStatus.success,
    //       products: items,
    //       id: 1,
    //       errorMessage: ""
    //     ),);
    //   } catch (e) {
    //     emit(state.copyWith(
    //         status: CartStatus.error,
    //         products: [],
    //         id: 1,
    //         errorMessage: "Proceed Error"
    //     ));
    //   }
    //
    // });

    on<RemoveFromCart>((event, emit) async {});
    on<UpdateQuantity>((event, emit) async {});
  }
}


// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:myapp/domain/entities/cart_entity.dart';
// import 'package:myapp/domain/entities/product_entity.dart';
// import 'package:myapp/presentation/blocs/cart/cart_event.dart';
// import 'package:myapp/presentation/blocs/cart/cart_state.dart';
//
// class CartBloc extends Bloc<CartEvent, CartState> {
//   final repository;
//
//   CartBloc(this.repository) : super(const CartState()) {
//     on<InitEvent>((event, emit) async {
//       // Load initial cart from repository if needed
//       final cart = await repository.getCart();
//       emit(state.copyWith(
//         userId: cart.userId,
//         products: cart.products,
//       ));
//     });
//
//     on<AddToCart>((event, emit) async {
//       print("Adding item to cart: ${event.product.title}");
//
//       // Check if product already exists in cart
//       final existingIndex = state.products.indexWhere((p) => p.id == event.product.id);
//
//
//       List<ProductEntity> updatedProducts = List.from(state.products);
//       print("object123: ${event.product.title}");
//
//       print("AA: $existingIndex");
//       if (existingIndex != -1) {
//         // If exists, increase quantity
//         final existingProduct = updatedProducts[existingIndex];
//         updatedProducts[existingIndex] = ProductEntity(
//           id: existingProduct.id,
//           title: existingProduct.title,
//           price: existingProduct.price,
//           description: existingProduct.description,
//           category: existingProduct.category,
//           image: existingProduct.image,
//           // quantity: existingProduct.quantity + event.quantity,
//         );
//       } else {
//         // Add new product
//         updatedProducts.add(ProductEntity(
//           id: event.product.id,
//           title: event.product.title,
//           price: event.product.price,
//           description: event.product.description,
//           category: event.product.category,
//           image: event.product.image,
//           // quantity: event.quantity,
//         ));
//       }
//
//       emit(state.copyWith(products: updatedProducts));
//     });
//
//     on<RemoveFromCart>((event, emit) async {
//       final updatedProducts = state.products.where((p) => p.id != event.productId).toList();
//       emit(state.copyWith(products: updatedProducts));
//     });
//
//     on<UpdateQuantity>((event, emit) async {
//       final index = state.products.indexWhere((p) => p.id == event.productId);
//       if (index != -1) {
//         List<ProductEntity> updatedProducts = List.from(state.products);
//         final product = updatedProducts[index];
//         updatedProducts[index] = ProductEntity(
//           id: product.id,
//           title: product.title,
//           price: product.price,
//           description: product.description,
//           category: product.category,
//           image: product.image,
//           // quantity: event.quantity,
//         );
//         emit(state.copyWith(products: updatedProducts));
//       }
//     });
//   }
// }
//
