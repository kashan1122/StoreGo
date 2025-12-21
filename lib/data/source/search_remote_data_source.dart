import '../model/search_model.dart';

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
