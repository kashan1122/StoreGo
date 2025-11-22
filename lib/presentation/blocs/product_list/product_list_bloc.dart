import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/domain/usecases/product_usecase.dart';
import 'product_list_event.dart';
import 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final GetProducts getProducts;

  ProductListBloc(this.getProducts) : super(const ProductListState()) {
    on<LoadProducts>((event, emit) async {
      emit(state.copyWith(loading: true));
      try {
        final items = await getProducts();
        emit(state.copyWith(loading: false, products: items));
      } catch (_) {
        emit(state.copyWith(loading: false, error: "Failed to load data"));
      }
    });
  }
}
