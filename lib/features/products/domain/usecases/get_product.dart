import 'package:clementoni/features/products/domain/entities/product.dart';
import 'package:clementoni/features/products/domain/repositories/products_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetProduct extends UseCase<Product, Params> {
  final ProductsRepository productsRepository;

  GetProduct(this.productsRepository);
  @override
  Future<Either<Failure, Product>> call(Params params) async {
    return await productsRepository.getProduct(params.id);
  }
}

class Params {
  final int id;

  Params({required this.id});
}
