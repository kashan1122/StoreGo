import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/domain/entities/search_entity.dart';
import 'package:myapp/domain/repositories/search_repository.dart';
import 'search_event.dart';
import 'search_state.dart';

// class SearchBloc extends Bloc<SearchEvent, SearchState> {
//   final List<SearchEntity> allProducts;
//
//   SearchBloc(this.allProducts) : super(SearchState.initial()) {
//     on<SearchQueryChanged>(_onSearch);
//     on<ClearSearch>(_onClear);
//   }
//
//   void _onSearch(SearchQueryChanged event, Emitter<SearchState> emit) {
//     final query = event.query.toLowerCase();
//
//     if (query.isEmpty) {
//       emit(SearchState.initial());
//       return;
//     }
//
//     final results =
//     allProducts.where((product) {
//       return product.title.toLowerCase().contains(query) ;
//           // ||
//           // product.category.toLowerCase().contains(query);
//     }).toList();
//
//     emit(
//       state.copyWith(
//         status: results.isEmpty ? SearchStatus.empty : SearchStatus.success,
//         products: results,
//         query: event.query,
//       ),
//     );
//   }
//
//   void _onClear(ClearSearch event, Emitter<SearchState> emit) {
//     emit(SearchState.initial());
//   }
// }
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository repository;

  SearchBloc(this.repository) : super(SearchState.initial()) {
    on<SearchQueryChanged>(_onSearch);
  }

  Future<void> _onSearch(
      SearchQueryChanged event,
      Emitter<SearchState> emit,
      ) async {
    emit(SearchState.initial());

    try {
      final results = await repository.search(event.query);
      // emit(SearchLoaded(results));
      emit(
        state.copyWith(
          status: results.isEmpty ? SearchStatus.empty : SearchStatus.success,
          products: results,
          query: event.query,
        ),
      );
    } catch (e) {
      emit(SearchState.error());
      // emit(SearchState.error(
      //
      //   status: results.isEmpty ? SearchStatus.empty : SearchStatus.success,
      //   products: results,
      //   query: event.query,
      //
      // ));
    }
  }

}
