import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/core/constants/api_url.dart';
import 'package:myapp/core/theme/dark_theme.dart';
import 'package:myapp/core/theme/light_theme.dart';
import 'package:myapp/core/theme/theme_bloc/theme_bloc.dart';
import 'package:myapp/data/repositories/remote/auth_repo_impl.dart';
import 'package:myapp/data/repositories/remote/cart_repo_impl.dart';
import 'package:myapp/data/repositories/remote/remote_data_repo.dart';
import 'package:myapp/data/repositories/remote/search_repository_impl.dart';
import 'package:myapp/data/source/auth_remote_data.dart';
import 'package:myapp/data/source/cart_remote_data.dart';
import 'package:myapp/data/source/product_remote_data.dart';
import 'package:myapp/data/source/search_remote_data_source.dart';
import 'package:myapp/domain/repositories/auth_repo.dart';
import 'package:myapp/domain/repositories/cart_repo.dart';
import 'package:myapp/domain/repositories/product_repostory.dart';
import 'package:myapp/domain/repositories/search_repository.dart';
import 'package:myapp/domain/usecases/auth_usecase.dart';
import 'package:myapp/presentation/blocs/auth/auth_bloc.dart';
import 'package:myapp/presentation/blocs/cart/cart_bloc.dart';
import 'package:myapp/presentation/blocs/product/product_bloc.dart';
import 'package:myapp/presentation/blocs/search/search_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> setupInjector() async {
  _registerNetwork();
  _registerThemes();
  _registerDataSources();
  _registerRepositories();
  _registerUseCases();
  _registerBlocs();
}

void _registerNetwork() {
  // sl.registerLazySingleton<http.Client>(
  //       () => http.Client(),
  // );
  sl.registerLazySingleton<Dio>(() {
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  });
}

/// Register theme dependencies
void _registerThemes() {
  sl.registerLazySingleton<LightTheme>(
    () => LightTheme(),
  );

  sl.registerLazySingleton<DarkTheme>(
    () => DarkTheme(),
  );

  sl.registerFactory<ThemeBloc>(
    () => ThemeBloc(
      sl<LightTheme>(),
      sl<DarkTheme>(),
    ),
  );
}

void _registerDataSources() {
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );
}

void _registerRepositories() {
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<CartRepo>(
    () => CartRepoImpl(sl()),
  );

  sl.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl()),
  );
}

void _registerUseCases() {
  sl.registerLazySingleton(
    () => LoginUseCase(sl()),
  );
}

void _registerBlocs() {
  sl.registerFactory<ProductBloc>(
    () => ProductBloc(sl()),
  );

  sl.registerFactory<CartBloc>(
    () => CartBloc(sl()),
  );

  sl.registerFactory<SearchBloc>(
    () => SearchBloc(sl()),
  );

  sl.registerFactory<LoginBloc>(
    () => LoginBloc(sl()),
  );
}
