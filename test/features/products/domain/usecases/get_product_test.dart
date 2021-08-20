import 'package:clementoni/core/usecases/usecase.dart';
import 'package:clementoni/features/products/domain/entities/product.dart';
import 'package:clementoni/features/products/domain/entities/products.dart';
import 'package:clementoni/features/products/domain/repositories/products_repository.dart';
import 'package:clementoni/features/products/domain/usecases/get_products.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'products_repository.mocks.dart';

// class MockProductsRepository extends Mock implements ProductsRepository {}

@GenerateMocks([ProductsRepository])
void main() {
  MockProductsRepository mockProductsRepository = MockProductsRepository();
  GetProducts usecase = GetProducts(mockProductsRepository);

  final tProducts = Products(
    list: [
      Product(
        id: 1,
        name: 'A',
        category: 'B',
        age: 2,
        price: 1.0,
        details: ['ASD'],
      ),
    ],
  );

  test(
    'should get list of products',
    () async {
      // arrange
      when(mockProductsRepository.getProducts())
          .thenAnswer((_) async => Right(tProducts));
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, Right(tProducts));
      verify(mockProductsRepository.getProducts());
      verifyNoMoreInteractions(mockProductsRepository);
    },
  );
}
