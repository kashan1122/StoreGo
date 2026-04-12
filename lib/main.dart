import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/theme/dark_theme.dart';
import 'package:myapp/core/theme/light_theme.dart';
import 'package:myapp/core/theme/theme_bloc/theme_bloc.dart';
import 'package:myapp/core/theme/theme_bloc/theme_state.dart';
import 'package:myapp/data/repositories/remote/cart_repo_impl.dart';
import 'package:myapp/data/repositories/remote/remote_data_repo.dart';
import 'package:myapp/data/source/cart_remote_data.dart';
import 'package:myapp/data/source/product_remote_data.dart';
import 'package:myapp/presentation/blocs/cart/cart_bloc.dart';
import 'package:myapp/presentation/blocs/cart/cart_event.dart';
import 'package:myapp/presentation/blocs/product/product_bloc.dart';
import 'package:myapp/presentation/blocs/product/product_event.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/presentation/router/app_router.dart';
import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /// 🟦 PRODUCT BLOC
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(
            ProductRepositoryImpl(
              ProductRemoteDataSource(http.Client()),
            ),
          )..add(LoadProducts()),
        ),




        BlocProvider<CartBloc>(
          create: (context) => CartBloc(
            CartRepoImpl(
              CartRemoteDataSource(),
            ),
          )..add(InitEvent()),
        ),

        /// 🟪 THEME BLOC (Requires LightTheme & DarkTheme)
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(
            LightTheme(),
            DarkTheme(),
          ),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp.router(
            title: 'Flutter Demo',

            /// 🌞 dynamic light & dark theme based on ThemeBloc
            theme: themeState.isDark
                ? themeState.themeData // dark theme
                : themeState.themeData, // light theme
            routerConfig: appRouter, // <-- GO ROUTER CONTROLLER
          );
        },
      ),
    );
  }
}


