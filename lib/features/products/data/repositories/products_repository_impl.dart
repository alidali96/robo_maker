import 'package:clementoni/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/internet_connection.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/products.dart';
import '../../domain/repositories/products_repository.dart';
import '../datasources/products_local_data_source.dart';
import '../datasources/products_remote_data_source.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;
  final ProductsLocalDataSource localDataSource;
  final InternetConnection internetConnection;

  ProductsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.internetConnection,
  });

  @override
  Future<Either<Failure, Products>> getProducts() async {
    if (await internetConnection.isConnected) {
      try {
        final productsModel = await remoteDataSource.getProducts();
        localDataSource.saveProductsLocally(productsModel);
        return Right(productsModel);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final productsModel = await localDataSource.getLocalProducts();
        return Right(productsModel);
      } on LocalException {
        return Left(LocalFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Product>> getProduct(int id) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }
}
