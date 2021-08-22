import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/products.dart';
import '../repositories/products_repository.dart';

class GetProducts extends UseCase<Products, NoParams> {
  final ProductsRepository productsRepository;

  GetProducts(this.productsRepository);
  @override
  Future<Either<Failure, Products>> call(NoParams params) async {
    return await productsRepository.getProducts();
  }
}
