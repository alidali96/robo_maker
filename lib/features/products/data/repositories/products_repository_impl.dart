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
    internetConnection.isConnected;
    return Right(await remoteDataSource.getProducts());
  }

  @override
  Future<Either<Failure, Product>> getProduct(int id) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }
}
