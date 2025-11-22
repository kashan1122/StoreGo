import 'package:http/http.dart' as http;
import 'package:myapp/data/model/product_model.dart';
import 'dart:convert';
import '../../core/constants/api_url.dart';

class ProductApi {
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse("$baseUrl/products"));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
