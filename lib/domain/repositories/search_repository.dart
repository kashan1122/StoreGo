import '../entities/search_entity.dart';

// abstract class SearchRepository {
//   Future<List<SearchEntity>> searchProducts(String query);
// }
abstract class SearchRepository {
  Future<List<SearchEntity>> search(String query);
}
