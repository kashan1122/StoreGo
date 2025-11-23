///OLD CODE
// // import 'package:http/http.dart' as http;
// // import 'package:myapp/data/model/product_model.dart';
// // import 'dart:convert';
// // import '../../core/constants/api_url.dart';
// //
// // class ProductApi {
// //   Future<List<ProductModel>> fetchProducts() async {
// //     final response = await http.get(Uri.parse("$baseUrl/products"));
// //
// //     if (response.statusCode == 200) {
// //       List data = jsonDecode(response.body);
// //       return data.map((e) => ProductModel.fromJson(e)).toList();
// //     } else {
// //       throw Exception("Failed to load products");
// //     }
// //   }
// // }
//
// import 'dart:convert';
//
// import 'package:myapp/core/constants/api_url.dart';
// import 'package:myapp/data/model/product_model.dart';
// import 'package:myapp/data/network/api_client.dart';
//
// class ProductRemoteDataSource {
//   // final ApiClient apiClient;
//
//   ProductRemoteDataSource();
//
//   Future<List<ProductModel>> getProducts() async {
//     final response = await ApiClient().get("$baseUrl/products");
//     return (response.body as List)
//         .map((e) => ProductModel.fromJson(e))
//         .toList();
//   }
//
//   Future<ProductModel> getProductById(int id) async {
//     final response = await ApiClient().get("https://example.com/products/$id");
//     return ProductModel.fromJson(response.body as Map<String, dynamic>);
//   }
// }

///CALL WITH DIO
// import 'package:dio/dio.dart';
// import 'package:myapp/data/model/product_model.dart';
//
// class ProductRemoteDataSource {
//   final Dio dio;
//
//   ProductRemoteDataSource(this.dio);
//
//   Future<List<ProductModel>> getProducts() async {
//     final response = await dio.get("https://example.com/products");
//
//     return (response.data as List)
//         .map((e) => ProductModel.fromJson(e))
//         .toList();
//   }
//
//   Future<ProductModel> getProductById(int id) async {
//     final response = await dio.get("https://example.com/products/$id");
//     return ProductModel.fromJson(response.data);
//   }
// }


import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/core/constants/api_url.dart';
import 'package:myapp/data/model/product_model.dart';

class ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSource(this.client);

  Future<List<ProductModel>> getProducts() async {
    final response = await client.get(
      Uri.parse("$baseUrl/products"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print("RESPONSE from getProducts: $response");
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }

  Future<ProductModel> getProductById(int id) async {
    final response = await client.get(
      Uri.parse("https://example.com/products/$id"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load product details");
    }
  }
}
