import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/responsive/size_extention.dart';
import 'package:myapp/core/theme/dark_theme.dart';
import 'package:myapp/core/theme/light_theme.dart';
import 'package:myapp/core/theme/theme_bloc/theme_bloc.dart';
import 'package:myapp/core/theme/theme_bloc/theme_event.dart';
import 'package:myapp/core/theme/theme_bloc/theme_state.dart';

import 'package:myapp/data/repositories/remote/remote_data_repo.dart';
import 'package:myapp/data/repositories/remote/search_repository_impl.dart';
import 'package:myapp/data/source/product_api.dart';
import 'package:myapp/data/source/search_remote_data_source.dart';
import 'package:myapp/domain/repositories/product_repostory.dart';
import 'package:myapp/presentation/blocs/product/product_bloc.dart';
import 'package:myapp/presentation/blocs/product/product_event.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/presentation/blocs/search/search_bloc.dart';
import 'package:myapp/presentation/blocs/search/search_event.dart';
import 'package:myapp/presentation/router/app_router.dart';
import 'package:myapp/screens/home/home_view.dart';

void main() {
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

        /// 🟪 THEME BLOC (Requires LightTheme & DarkTheme)
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(
            LightTheme(),
            DarkTheme(),
          ),
        ),


        // BlocProvider<SearchBloc>(
        //   create: (context) => SearchBloc(
        //     SearchRepositoryImpl(
        //       SearchRemoteDataSource(http.Client()),
        //     ),
        //   )..add(SearchQueryChanged(query)),
        // ),

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
