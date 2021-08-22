import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/internet_connection.dart';
import 'features/products/data/datasources/products_local_data_source.dart';
import 'features/products/data/datasources/products_remote_data_source.dart';
import 'features/products/data/repositories/products_repository_impl.dart';
import 'features/products/domain/repositories/products_repository.dart';
import 'features/products/domain/usecases/get_product.dart';
import 'features/products/domain/usecases/get_products.dart';
import 'features/products/presentation/bloc/product/product_bloc.dart';
import 'features/products/presentation/bloc/products/products_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  /// Features - Products
  // Blocs
  getIt.registerFactory(() => ProductsBloc(getProducts: getIt()));
  getIt.registerFactory(() => ProductBloc(getProduct: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => GetProducts(getIt()));
  getIt.registerLazySingleton(() => GetProduct(getIt()));

  // Repository
  getIt.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(
      internetConnection: getIt(),
      localDataSource: getIt(),
      remoteDataSource: getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSourceImpl(dio: getIt()),
  );

  getIt.registerLazySingleton<ProductsLocalDataSource>(
    () => ProductsLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  /// Core
  getIt.registerLazySingleton<InternetConnection>(
    () => InternetConnectionImpl(dataConnectionChecker: getIt()),
  );

  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => DataConnectionChecker());
}
