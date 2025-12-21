import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/presentation/blocs/search/search_bloc.dart';
import 'package:myapp/presentation/blocs/search/search_event.dart';
import 'package:myapp/presentation/blocs/search/search_state.dart';

class SearchTablet extends StatefulWidget {
  const SearchTablet({super.key});

  @override
  State<SearchTablet> createState() => _SearchTabletState();
}

class _SearchTabletState extends State<SearchTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              autofocus: true,
              decoration: const InputDecoration(
                hintText: "Search products...",
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                context
                    .read<SearchBloc>()
                    .add(SearchQueryChanged(value));
              },
            ),
          ),

          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.status == SearchStatus.initial) {
                  return const Center(child: Text("Start typing to search"));
                }

                if (state.status == SearchStatus.empty) {
                  return const Center(child: Text("No results found"));
                }

                return ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return ListTile(
                      leading: Image.network(product.image, width: 50),
                      title: Text(product.title),
                      subtitle: Text(product.category),
                      onTap: () {
                        // go to product detail
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
