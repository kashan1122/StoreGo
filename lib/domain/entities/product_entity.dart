class ProductEntity {
  final int id;
  final String title;
  final String description;
  final String image;
  final dynamic price;
  final String category;
  // final String quantity;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    // required this.quantity,
  });
}
