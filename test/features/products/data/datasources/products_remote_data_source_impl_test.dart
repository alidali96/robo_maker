import 'package:clementoni/constants.dart';
import 'package:clementoni/core/error/exceptions.dart';
import 'package:clementoni/features/products/data/datasources/products_remote_data_source.dart';
import 'package:clementoni/features/products/data/models/product_model.dart';
import 'package:clementoni/features/products/data/models/products_model.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'products_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  final mockDio = MockDio();
  final productsRemoteDataSourceImpl =
      ProductsRemoteDataSourceImpl(dio: mockDio);

  final tProductJson = fixture('product.json');
  final tProductsJson = fixture('products.json');
  final tProductModel = ProductModel.fromJson(tProductJson);
  final tProductsModel = ProductsModel.fromJson(tProductsJson);
  final tProductId = tProductModel.id;

  final apiURLProducts = '$kBaseAPI/products';
  final apiURLProduct = '$kBaseAPI/products?id=$tProductId';

  final productsResponseSuccess = Response(
    requestOptions: RequestOptions(
      headers: {
        Headers.contentTypeHeader: 'application/json',
      },
      path: apiURLProducts,
    ),
    data: tProductsJson,
    statusCode: 200,
  );

  final productResponseSuccess = Response(
    requestOptions: RequestOptions(
      headers: {
        Headers.contentTypeHeader: 'application/json',
      },
      path: apiURLProduct,
    ),
    data: tProductJson,
    statusCode: 200,
  );

  final productsResponseFailure = Response(
    requestOptions: RequestOptions(
      headers: {
        Headers.contentTypeHeader: 'application/json',
      },
      path: apiURLProducts,
    ),
    data: tProductsJson,
    statusCode: 500,
  );

  final productResponseFailure = Response(
    requestOptions: RequestOptions(
      headers: {
        Headers.contentTypeHeader: 'application/json',
      },
      path: apiURLProduct,
    ),
    data: tProductJson,
    statusCode: 500,
  );

  group('get products', () {
    test('should make a get request to api with headers', () async {
      when(mockDio.get(any, options: anyNamed('options')))
          .thenAnswer((_) async => productsResponseSuccess);

      productsRemoteDataSourceImpl.getProducts();

      verify(mockDio.get(apiURLProducts,
          options: productsRemoteDataSourceImpl.options));
    });
    test('should return products when request is success (200)', () async {
      when(mockDio.get(any, options: anyNamed('options')))
          .thenAnswer((_) async => productsResponseSuccess);

      final products = await productsRemoteDataSourceImpl.getProducts();

      verify(mockDio.get(apiURLProducts,
          options: productsRemoteDataSourceImpl.options));
      expect(products, tProductsModel);
    });

    test('should throw ServerException when request is failed (not 200)',
        () async {
      when(mockDio.get(any, options: anyNamed('options')))
          .thenAnswer((_) async => productsResponseFailure);

      final method = () => productsRemoteDataSourceImpl.getProducts();

      expect(method, throwsA(TypeMatcher<ServerException>()));
    });
  });

  group('get product', () {
    test('should make a get request to api with headers', () async {
      when(mockDio.get(any, options: anyNamed('options')))
          .thenAnswer((_) async => productResponseSuccess);

      productsRemoteDataSourceImpl.getProduct(tProductId);

      verify(mockDio.get(apiURLProduct,
          options: productsRemoteDataSourceImpl.options));
    });
    test('should return product when request is success (200)', () async {
      when(mockDio.get(any, options: anyNamed('options')))
          .thenAnswer((_) async => productResponseSuccess);

      final product = await productsRemoteDataSourceImpl.getProduct(tProductId);

      verify(mockDio.get(apiURLProduct,
          options: productsRemoteDataSourceImpl.options));
      expect(product, tProductModel);
    });

    test('should throw ServerException when request is failed (not 200)',
        () async {
      when(mockDio.get(any, options: anyNamed('options')))
          .thenAnswer((_) async => productResponseFailure);

      final method = () => productsRemoteDataSourceImpl.getProducts();

      expect(method, throwsA(TypeMatcher<ServerException>()));
    });
  });
}
