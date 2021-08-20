import 'package:clementoni/features/products/domain/entities/products.dart';
import 'package:clementoni/features/products/domain/repositories/products_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetProducts extends UseCase<Products, NoParams> {
  final ProductsRepository productsRepository;

  GetProducts(this.productsRepository);
  @override
  Future<Either<Failure, Products>> call(NoParams params) async {
    return await productsRepository.getProducts();
  }
}
