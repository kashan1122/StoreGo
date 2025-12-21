enum SearchStatus { initial, loading, success, empty, error }

class SearchState {
  final SearchStatus status;
  final List products;
  final String query;

  SearchState({
    required this.status,
    required this.products,
    required this.query,
  });

  factory SearchState.initial() => SearchState(
    status: SearchStatus.initial,
    products: [],
    query: '',
  );
  factory SearchState.loading() => SearchState(
    status: SearchStatus.loading,
    products: [],
    query: '',
  );
  factory SearchState.error() => SearchState(
    status: SearchStatus.error,
    products: [],
    query: '',
  );

  SearchState copyWith({
    SearchStatus? status,
    List? products,
    String? query,
  }) {
    return SearchState(
      status: status ?? this.status,
      products: products ?? this.products,
      query: query ?? this.query,
    );
  }
}
