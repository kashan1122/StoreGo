import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/data/network/api_client.dart';
import 'package:myapp/data/repositories/local/local_data_repo.dart';
import 'package:myapp/data/repositories/remote/remote_data_repo.dart';
import 'package:myapp/data/source/product_api.dart';
import 'package:myapp/domain/repositories/product_repostory.dart';
import 'package:myapp/presentation/blocs/product/product_bloc.dart';
import 'package:myapp/presentation/blocs/product/product_event.dart';
import 'package:myapp/screens/product_list/product_list_view.dart';
import 'package:http/http.dart' as http;

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const ProductList(title: 'Product Listing'),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<ProductBloc>(
              create: (context) => ProductBloc( ProductRepositoryImpl(
                ProductRemoteDataSource(http.Client()), // ← pass your data source here
              ),)
                ..add(LoadProducts()),
            ),
          ],
          child: const ProductList(title: 'Product Listing'),
        )
    );
  }
}

