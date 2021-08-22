import 'package:clementoni/core/usecases/usecase.dart';
import 'package:clementoni/features/products/domain/entities/product.dart';
import 'package:clementoni/features/products/domain/repositories/products_repository.dart';
import 'package:clementoni/features/products/domain/usecases/get_product.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'products_repository.mocks.dart';

// class MockProductsRepository extends Mock implements ProductsRepository {}

@GenerateMocks([ProductsRepository])
void main() {
  MockProductsRepository mockProductsRepository = MockProductsRepository();
  GetProduct usecase = GetProduct(mockProductsRepository);

  final tProductId = 1;
  final tProduct = Product(
    id: tProductId,
    age: 4,
    name: 'Robo',
    image:
        "https://www.clementoni.com/media/prod/be/66926/robomaker-start_lGqT6Ka.jpg",
    price: 1.5,
    category: 'Robot',
    details: [],
  );

  test(
    'should get product with id $tProductId',
    () async {
      // arrange
      when(mockProductsRepository.getProduct(any))
          .thenAnswer((_) async => Right(tProduct));
      // act
      final result = await usecase(Params(id: tProductId));
      // assert
      expect(result, Right(tProduct));
      verify(mockProductsRepository.getProduct(tProductId));
      verifyNoMoreInteractions(mockProductsRepository);
    },
  );
}
