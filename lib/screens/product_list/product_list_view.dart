import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/data/repositories/local/local_data_repo.dart';
import 'package:myapp/data/repositories/remote/remote_data_repo.dart';
import 'package:myapp/data/source/product_api.dart';
import 'package:myapp/domain/repositories/product_repostory.dart';
import 'package:myapp/presentation/blocs/product/product_bloc.dart';
import 'package:myapp/presentation/blocs/product/product_event.dart';
import 'package:myapp/presentation/blocs/product/product_state.dart';
import '../product_detail/product_detail_view.dart';
import 'package:http/http.dart' as http;


class ProductList extends StatefulWidget {
  const ProductList({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body:
        BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          if (state.status == Status.initial) {
            return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: // Inside your ListView.builder
                        ListTile(
                      title: Text(state.products[index].title),
                      subtitle: Text(state.products[index].description),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BlocProvider(
                              create: (context) =>
                                  ProductBloc(ProductRepositoryImpl(
                                    ProductRemoteDataSource(http.Client()), // ← pass your data source here
                                  )
                                  )
                                    ..add(LoadProductById(
                                         state.products[index].id)),
                              child: ProductDetailView(
                                  postId: state.products[index].id),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                });
          } else if (state.status == Status.error) {
            return const Text("Failed to load");
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        })
    );
  }
}
