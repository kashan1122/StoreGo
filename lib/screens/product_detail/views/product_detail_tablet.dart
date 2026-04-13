import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/domain/entities/product_entity.dart';
import 'package:myapp/presentation/blocs/search/search_bloc.dart';
import 'package:myapp/presentation/blocs/search/search_event.dart';
import 'package:myapp/presentation/blocs/search/search_state.dart';

class ProductDetailTablet extends StatefulWidget {
  const ProductDetailTablet({super.key, required this.data});

  final ProductEntity data;

  @override
  State<ProductDetailTablet> createState() => _ProductDetailTabletState();
}

class _ProductDetailTabletState extends State<ProductDetailTablet> {
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
                context.read<SearchBloc>().add(SearchQueryChanged(value));
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
