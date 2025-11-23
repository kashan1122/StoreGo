// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import 'package:myapp/data/model/product_model.dart';
//
//
// class ApiClient {
//   Future<List<ProductModel>> get() async {
//     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//
//     if (response.statusCode == 200) {
//       final List<dynamic> productInJson = json.decode(response.body);
//       return productInJson.map((json) => ProductModel.fromJson(json)).toList();
//     } else {
//       throw Exception('Error fetching posts');
//     }
//   }
//   // Add this method to your PostRepository
//   Future<ProductModel> getById(int id) async {
//     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'));
//
//     if (response.statusCode == 200) {
//       return ProductModel.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Error fetching post');
//     }
//   }
//
// }


import 'package:http/http.dart' as http;

class ApiClient {
  final http.Client client;

  ApiClient(this.client);

  Future<http.Response> get(String url) async {
    return await client.get(Uri.parse(url));
  }
}

