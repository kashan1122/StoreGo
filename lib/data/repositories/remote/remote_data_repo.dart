// import 'package:myapp/data/model/product_model.dart';
// import 'package:myapp/data/network/api_client.dart';
// import 'package:myapp/data/source/product_api.dart';
//
//
// class DataRepo {
//   Future getRepoDataById(id) async {
//     // final response = await ApiClient().getProducts(id);
//     final response = ProductRemoteDataSource().getProducts();
//     print("RESPONSE FROM REPO: $response");
//     return response;
//   }
//
//   Future<List<ProductModel>> getRepoData() async {
//     final response = await ProductRemoteDataSource().getProducts();
//     print("RESPONSE FROM REPO: $response");
//
//     return response;
//   }
// }


import 'package:myapp/data/source/product_api.dart';
import 'package:myapp/domain/entities/product_entity.dart';
import 'package:myapp/domain/repositories/product_repostory.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remote;

  ProductRepositoryImpl(this.remote);

  @override
  Future<List<ProductEntity>> getProducts() async {
    final data = await remote.getProducts();
    return data.map((e) => e.toEntity()).toList();
  }

  @override
  Future<ProductEntity> getProductById(int id) async {
    final data = await remote.getProductById(id);
    return data.toEntity();
  }
}
