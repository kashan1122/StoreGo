import 'package:equatable/equatable.dart';
import 'package:myapp/domain/entities/product_entity.dart';

class ProductListState extends Equatable {
  final bool loading;
  final List<ProductEntity> products;
  final String? error;

  const ProductListState({
    this.loading = false,
    this.products = const [],
    this.error,
  });

  ProductListState copyWith({
    bool? loading,
    List<ProductEntity>? products,
    String? error,
  }) =>
      ProductListState(
        loading: loading ?? this.loading,
        products: products ?? this.products,
        error: error,
      );

  @override
  List<Object?> get props => [loading, products, error];
}
