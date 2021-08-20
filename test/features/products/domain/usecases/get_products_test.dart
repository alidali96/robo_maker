import 'package:clementoni/core/usecases/usecase.dart';
import 'package:clementoni/features/products/domain/entities/products.dart';
import 'package:clementoni/features/products/domain/repositories/products_repository.dart';
import 'package:clementoni/features/products/domain/usecases/get_products.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockProductsRepository extends Mock implements ProductsRepository {}

void main() {
  MockProductsRepository mockProductsRepository = MockProductsRepository();
  GetProducts usecase = GetProducts(mockProductsRepository);

  // MockProductsRepository mockProductsRepository;
  // GetProducts usecase;
  // setUp(() {
  //   mockProductsRepository = MockProductsRepository();
  //   usecase = GetProducts(mockProductsRepository);
  // });

  final tProducts = Products.fromJson(fixture('products.json'));
  print(tProducts);
  test(
    'should get list of products',
    () async {
      // arrange
      when(mockProductsRepository.getProducts())
          .thenAnswer((_) async => Right(tProducts));
      // act
      final result = await usecase(NoParams());
      print('Result');
      print(result);
      // assert
      expect(result, Right(tProducts));
      verify(mockProductsRepository.getProducts());
    },
  );

  // test('test', () {
  //   expect(1, 1);
  // });
}
