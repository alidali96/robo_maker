import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product.dart';
import '../repositories/products_repository.dart';

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
