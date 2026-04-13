import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/domain/repositories/search_repository.dart';
import 'search_event.dart';
import 'search_state.dart';

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
      emit(
        state.copyWith(
          status: results.isEmpty ? SearchStatus.empty : SearchStatus.success,
          products: results,
          query: event.query,
        ),
      );
    } catch (e) {
      emit(SearchState.error());
    }
  }

}
