// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:myapp/data/model/search_model.dart';
//
// class SearchRemoteDataSource {
//   final http.Client client;
//
//   SearchRemoteDataSource(this.client);
//
//   Future<List<SearchModel>> searchProducts(String query) async {
//     final response = await client.get(
//       Uri.parse('https://fakestoreapi.com/products'),
//     );
//
//     if (response.statusCode == 200) {
//       final List data = json.decode(response.body);
//
//       return data
//           .map((e) => SearchModel.fromJson(e))
//           .where((product) =>
//           product.title.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     } else {
//       throw Exception('Search failed');
//     }
//   }
// }



import 'package:myapp/domain/entities/search_entity.dart';

import '../model/search_model.dart';

// class SearchRemoteDataSource {
//   Future<List<SearchEntity>> searchProducts(String query) async {
//     await Future.delayed(const Duration(milliseconds: 300)); // simulate API
//     print("QUERY: $query");
//     final response = [
//       {
//         "id": 1,
//         "title": "Fjallraven Backpack",
//         "price": 109.95,
//         "description": "Perfect pack for everyday use",
//         "category": "men's clothing",
//         "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
//         "rating": {"rate": 3.9, "count": 120}
//       },
//       {
//         "id": 2,
//         "title": "Mens Casual T-Shirts",
//         "price": 22.3,
//         "description": "Slim fit casual wear",
//         "category": "men's clothing",
//         "image": "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png",
//         "rating": {"rate": 4.1, "count": 259}
//       },
//       {
//         "id": 3,
//         "title": "Mens Cotton Jacket",
//         "price": 55.99,
//         "description": "Great outerwear jacket",
//         "category": "men's clothing",
//         "image": "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_t.png",
//         "rating": {"rate": 4.7, "count": 500}
//       },
//     ];
//     print("QUERY12: $query");
//
//     final products =
//     response.map((e) => SearchModel.fromJson(e)).toList();
//
//     /// 🔍 Filter logic (case-insensitive search)
//     return products.where((product) {
//       final q = query.toLowerCase();
//       print("source return type: ${product.title.toLowerCase().contains(q).runtimeType}");
//       return product.title.toLowerCase().contains(q) ;
//           // || product.category.toLowerCase().contains(q);
//     }).toList();
//   }
// }

class SearchRemoteDataSource {
  Future<List<SearchModel>> search(String query) async {
    final data = [
      {
        "id": 1,
        "title": "Fjallraven Backpack",
        "price": 109.95,
        "description": "Perfect pack for everyday use",
        "category": "men's clothing",
        "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
        "rating": {"rate": 3.9, "count": 120}
      },
      {
        "id": 2,
        "title": "Mens Casual T-Shirts",
        "price": 22.3,
        "description": "Slim fit casual wear",
        "category": "men's clothing",
        "image": "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png",
        "rating": {"rate": 4.1, "count": 259}
      },
      {
        "id": 3,
        "title": "Mens Cotton Jacket",
        "price": 55.99,
        "description": "Great outerwear jacket",
        "category": "men's clothing",
        "image": "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_t.png",
        "rating": {"rate": 4.7, "count": 500}
      },
    ];
    return data
        .where((item) =>
        item['title'].toString().toLowerCase().contains(query.toLowerCase()))
        .map((e) => SearchModel.fromJson(e))
        .toList();
  }
}
