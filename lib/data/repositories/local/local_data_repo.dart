import 'package:myapp/data/model/product_model.dart';

class DataRepo {
  final List<ProductModel> _localProducts = [
    ProductModel(
      category: "Shoes",
      id: 1,
      title: "Nike Air Max",
      description: "Comfortable running shoes with premium cushioning.",
      price: 149.99,
      image: "assets/images/nike.png",
    ),
    ProductModel(
      category: "Electronic",
      id: 2,
      title: "Apple AirPods Pro",
      description: "Noise-cancelling wireless earbuds with spatial audio.",
      price: 249.99,
      image: "assets/images/airpods.png",
    ),
    ProductModel(
      category: "Electronic",
      id: 3,
      title: "Samsung Galaxy Watch",
      description: "Smartwatch with health tracking and AMOLED display.",
      price: 199.99,
      image: "assets/images/watch.png",
    ),
  ];

  // ✔ Get product list locally
  Future<List<ProductModel>> getProducts() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _localProducts;
  }

  // ✔ Get product by ID locally
  Future<ProductModel?> getProductById(int id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _localProducts.firstWhere(
          (product) => product.id == id,
      orElse: () => ProductModel(
        category: "",
        id: 0,
        title: "Not Found",
        description: "No product found.",
        price: 0.0,
        image: "",
      ),
    );
  }
}
