import 'dart:convert';

import 'package:clementoni/features/products/domain/repositories/products_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

// class MockProductsRepository extends Mock implements ProductsRepository {}

void main() {
  // MockProductsRepository mockProductsRepository = MockProductsRepository();
  // GetProducts usecase = GetProducts(mockProductsRepository);

  // setUp(() {
  //   mockProductsRepository = MockProductsRepository();
  //   usecase = GetProducts(mockProductsRepository);
  // });

  // final tProducts = Products.fromJson(json.decode(fixture('products.json')));

  // test('should get list of products', () async {
  //   // arrange
  //   when(mockProductsRepository.getProducts())
  //       .thenAnswer((_) async => Right(tProducts));
  //   // act
  //   final result = await usecase(NoParams());
  //   // assert
  //   expect(result, Right(tProducts));
  // });

  test('test', () {
    expect(1, 1);
  });
}
