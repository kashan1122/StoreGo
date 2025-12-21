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
    });
  }
}
