import 'package:myapp/data/source/search_remote_data_source.dart';
import 'package:myapp/domain/entities/search_entity.dart';
import 'package:myapp/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource dataSource;

  SearchRepositoryImpl(this.dataSource);

  @override
  Future<List<SearchEntity>> search(String query) async {
    return dataSource.search(query);
  }
}

