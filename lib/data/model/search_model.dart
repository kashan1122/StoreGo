
import 'package:myapp/domain/entities/search_entity.dart';

class SearchModel extends SearchEntity {
  const SearchModel({
    required super.id,
    required super.title,
    required super.image,
    required super.price,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
    );
  }


  // SearchEntity toEntity() {
  //   return SearchEntity(
  //       id: id,
  //       title: title,
  //       image: image,
  //       price: price,
  //   );
  // }
}
