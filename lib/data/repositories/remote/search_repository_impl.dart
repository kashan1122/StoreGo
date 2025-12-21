
import 'package:myapp/data/source/search_remote_data_source.dart';
import 'package:myapp/domain/entities/search_entity.dart';
import 'package:myapp/domain/repositories/search_repository.dart';
import 'package:myapp/data/model/search_model.dart';

// class SearchRepositoryImpl implements SearchRepository {
//   final SearchRemoteDataSource remoteDataSource;
//
//   SearchRepositoryImpl(this.remoteDataSource);
//
//   @override
//   Future<List<SearchEntity>> searchProducts(String query) async{
//     return remoteDataSource.searchProducts(query);
//     // final data = await remoteDataSource.searchProducts(query);
//     // return data.map((e) => e.toEntity()).toList();
//   }
// }

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource dataSource;

  SearchRepositoryImpl(this.dataSource);

  @override
  Future<List<SearchEntity>> search(String query) async {
    // final models = await dataSource.search(query);
    // return models.map((e) => e.toEntity()).toList();
    return dataSource.search(query);
  }
}

