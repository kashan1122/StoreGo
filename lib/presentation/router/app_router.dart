import 'package:go_router/go_router.dart';
import 'package:myapp/core/constants/app_strings.dart';
import 'package:myapp/data/model/product_model.dart';
import 'package:myapp/domain/entities/product_entity.dart';
import 'package:myapp/screens/home/home_view.dart';
import 'package:myapp/screens/product_detail/product_detail_view.dart';
import 'package:myapp/screens/product_list/product_list_view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeView(title: "Product Listing"),
    ),

    GoRoute(
      path: '/product_list',
      name: 'productList',
      builder: (context, state) {
        // Extract the parameter from state.pathParameters
        final product = state.extra as List<ProductEntity>;
        return ProductListView(data: product);
      },
    ),
  ],
);
