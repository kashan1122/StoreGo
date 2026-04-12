class CartEntity {
  final int productId;
  final int quantity;

  const CartEntity({
    required this.productId,
    required this.quantity,
  });

  CartEntity copyWith({
    int? productId,
    int? quantity,
  }) {
    return CartEntity(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
    );
  }
}
