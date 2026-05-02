import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/data/repositories/remote/cart_repo_impl.dart';
import 'package:myapp/data/repositories/remote/search_repository_impl.dart';
import 'package:myapp/data/source/cart_remote_data.dart';
import 'package:myapp/data/source/search_remote_data_source.dart';
import 'package:myapp/domain/entities/product_entity.dart';
import 'package:myapp/presentation/blocs/cart/cart_bloc.dart';
import 'package:myapp/presentation/blocs/search/search_bloc.dart';
import 'package:myapp/screens/cart/cart_view.dart';
import 'package:myapp/screens/checkout/chekout_view.dart';
import 'package:myapp/screens/landing/landing_view.dart';
import 'package:myapp/screens/onboarding/onboarding_view.dart';
import 'package:myapp/screens/product_detail/product_detail_view.dart';
import 'package:myapp/screens/search/search_view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'onboarding',
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: '/landing',
      name: 'landing',
      builder: (context, state) => const LandingView(title: "Product Listing"),
    ),
    // GoRoute(
    //   path: '/product_list',
    //   name: 'productList',
    //   builder: (context, state) {
    //     final product = state.extra as List<ProductEntity>;
    //     return ProductListView(data: product);
    //   },
    // ),
    GoRoute(
      path: '/product_detail',
      name: 'productDetail',
      builder: (context, state) {
        final extra = state.extra as ProductEntity;
        if (extra is! ProductEntity) {
          return const Scaffold(
            body: Center(child: Text('Invalid product id')),
          );
        }
        return ProductDetailView(productEntity: extra);
      },
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) {
        return BlocProvider(
          create: (_) => SearchBloc(
            SearchRepositoryImpl(
              SearchRemoteDataSource(),
            ),
          ),
          child: const SearchView(),
        );
      },
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) {
        return BlocProvider(
          create: (_) => CartBloc(
            CartRepoImpl(
              CartRemoteDataSource(),
            ),
          ),
          child: const CartView(title: ""),
        );
      },
    ),
    GoRoute(
      path: '/checkout',
      builder: (context, state) {
        return const CheckoutView();
        // return BlocProvider(
        //   create: (_) => CartBloc(
        //     CartRepoImpl(
        //       CartRemoteDataSource(),
        //     ),
        //   ),
        //   child: const CheckoutView(title: ""),
        // );
      },
    ),
  ],
);
