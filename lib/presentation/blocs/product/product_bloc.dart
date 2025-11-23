// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:myapp/data/model/product_model.dart';
// import 'package:myapp/data/repositories/remote/remote_data_repo.dart';
// import 'package:myapp/presentation/blocs/product/product_event.dart';
// import 'package:myapp/presentation/blocs/product/product_state.dart';
//
// class ProductBloc extends Bloc<ProductEvent, ProductState> {
//   // final GetProducts getProducts;
//
//   ProductBloc() : super(ProductState()) {
//     on<LoadProducts>((event, emit) async {
//       emit(state.copyWith(loading: true));
//       try {
//         List<ProductModel> items = await DataRepo().getRepoData();
//         emit(state.copyWith(loading: false, products: items));
//       } catch (_) {
//         emit(state.copyWith(loading: false, error: "Failed to load data"));
//       }
//     });
//   }
// }


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/data/model/product_model.dart';
import 'package:myapp/domain/repositories/product_repostory.dart';
import 'package:myapp/presentation/blocs/product/product_event.dart';
import 'package:myapp/presentation/blocs/product/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc(this.repository) : super(ProductState()) {

    on<LoadProducts>((event, emit) async {
      emit(state.copyWith(
        loading: true,
        error: "",
      ));

      try {
        final items = await repository.getProducts();
        emit(state.copyWith(
          loading: false,
          products: items,
        ));
      } catch (e) {
        emit(state.copyWith(
          loading: false,
          error: "Failed to load data",
        ));
      }
    });


    on<LoadProductById>((event, emit) async {
      emit(state.copyWith(
        loading: true,
        error: "",
      ));

      // try {
      //   final product = await repository.getProductById(event.id);
      //   emit(state.copyWith(
      //     loading: false,
      //     singleProduct: product,
      //   ));
      // } catch (e) {
      //   emit(state.copyWith(
      //     loading: false,
      //     error: "Failed to load product",
      //   ));
      // }
    });
  }
}
