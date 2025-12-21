class CartEntity {
  final int productId;
  final int quantity;


  const CartEntity({
    required this.productId,
    required this.quantity,
  });

  CartEntity copyWith({
    int? quantity,
  }) {
    return CartEntity(
      productId: productId,
      quantity: quantity ?? this.quantity,
    );
  }
}
