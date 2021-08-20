import 'package:clementoni/features/products/domain/entities/products.dart';
import 'package:clementoni/features/products/domain/entities/product.dart';
import 'package:clementoni/core/error/failures.dart';
import 'package:clementoni/features/products/domain/repositories/products_repository.dart';
import 'package:dartz/dartz.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  @override
  Future<Either<Failure, Product>> getProduct(int id) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Products>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
