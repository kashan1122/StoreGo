import 'package:myapp/domain/entities/product_entity.dart';

import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.image,
    required super.price,
    required super.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      price: json['price'].toDouble(),
      category: json['category'],
    );
  }
}
