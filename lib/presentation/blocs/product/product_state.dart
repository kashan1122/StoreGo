import 'package:equatable/equatable.dart';
import 'package:myapp/domain/entities/product_entity.dart';

enum Status {
  initial,
  loaded,
  loading,
  error,
}

class ProductState extends Equatable {
  final bool loading;
  final List<ProductEntity> products;
  final String? error;
  Status status;
  List<dynamic> items = [];

  ProductState({
    this.items = const [],
    this.status = Status.initial,
    this.loading = false,
    this.products = const [],
    this.error,
  });

  ProductState copyWith({
    bool? loading,
    List<ProductEntity>? products,
    String? error,
  }) =>
      ProductState(
        loading: loading ?? this.loading,
        products: products ?? this.products,
        error: error,
      );

  @override
  List<Object?> get props => [loading, products, error, status, items];
}
