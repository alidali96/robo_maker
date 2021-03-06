import 'package:clementoni/core/error/exceptions.dart';
import 'package:clementoni/core/error/failures.dart';
import 'package:clementoni/core/network/internet_connection.dart';
import 'package:clementoni/features/products/data/datasources/products_local_data_source.dart';
import 'package:clementoni/features/products/data/datasources/products_remote_data_source.dart';
import 'package:clementoni/features/products/data/models/product_model.dart';
import 'package:clementoni/features/products/data/models/products_model.dart';
import 'package:clementoni/features/products/data/repositories/products_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'products_repository_impl_test.mocks.dart';

@GenerateMocks([
  ProductsRemoteDataSource,
  ProductsLocalDataSource,
  InternetConnection,
])
void main() {
  final mockProductsRemoteDataSource = MockProductsRemoteDataSource();
  final mockProductsLocalDataSource = MockProductsLocalDataSource();
  final mockInternetConnection = MockInternetConnection();
  final repositoryImpl = ProductsRepositoryImpl(
    remoteDataSource: mockProductsRemoteDataSource,
    localDataSource: mockProductsLocalDataSource,
    internetConnection: mockInternetConnection,
  );

  final tProductId = 59122;

  final tProductModel = ProductModel(
    id: tProductId,
    name: "RoboMaker Starter",
    image:
        "https://www.clementoni.com/media/prod/be/66926/robomaker-start_lGqT6Ka.jpg",
    category: "Robot",
    age: 8,
    price: 45.95,
    details: [
      "Ein unglaubliches Labor, um die Geheimnisse der Robotik und Codierung durch Block-Programmierung zu entdecken.",
      "Baue 3 Roboter aus mehr als 200 Bauteilen, 2 Motoren, 1 Lautsprecher und 1 IR Sensor, und programmiere ihn so, dass er lustige Aktivitäten ausführen kann, was zur Entwicklung des rechnerischen Denkens beiträgt.",
      "Programmiere den X1-Drawer, um phantastische Designs zu erschaffen, spiel mit dem X2-Elevator, um Objekte aufzuheben oder schubse sie vom Tisch mit dem X3-Analyser!",
      "Durch den Gebrauch der Bedienungsanleitung wirst du zum Programmier-Experten, der in der Lage ist, jede andere Art von Roboter zu bauen und so zu programmieren, dass sie alles tun, was du willst."
    ],
  );

  final tProductsModel = ProductsModel(list: [tProductModel]);

  void testGetProducts() {
    group('test get products', () {
      setUp(() {
        when(mockProductsLocalDataSource.saveProductsLocally(any))
            .thenAnswer((_) async => true);
      });

      test('should check for internet connection', () async {
        // arrange
        when(mockInternetConnection.isConnected).thenAnswer((_) async => true);
        when(mockProductsRemoteDataSource.getProducts())
            .thenAnswer((_) async => tProductsModel);

        // act
        await repositoryImpl.getProducts();
        // assert
        verify(mockInternetConnection.isConnected);
      });

      group(
        'device is online',
        () {
          setUp(() {
            when(mockInternetConnection.isConnected)
                .thenAnswer((_) async => true);
          });

          test('should return remote data when the call success', () async {
            // arrange
            when(mockProductsRemoteDataSource.getProducts())
                .thenAnswer((_) async => tProductsModel);
            // act
            final products = await repositoryImpl.getProducts();
            // assert
            verify(mockProductsRemoteDataSource.getProducts());
            verify(mockProductsLocalDataSource
                .saveProductsLocally(tProductsModel));
            expect(products, equals(Right(tProductsModel)));
          });

          test('should return ServerFailure when the call fails', () async {
            // arrange
            when(mockProductsRemoteDataSource.getProducts())
                .thenThrow(ServerException());
            // act
            final result = await repositoryImpl.getProducts();
            // assert
            verify(mockProductsRemoteDataSource.getProducts());
            expect(result, equals(Left(ServerFailure())));
          });
        },
      );

      group(
        'device is offline',
        () {
          setUp(() {
            when(mockInternetConnection.isConnected)
                .thenAnswer((_) async => false);
          });

          test('should return saved products when there\'s saved data',
              () async {
            // arrange
            when(mockProductsLocalDataSource.getLocalProducts())
                .thenAnswer((_) async => tProductsModel);
            // act
            final products = await repositoryImpl.getProducts();
            // assert
            verify(mockProductsLocalDataSource.getLocalProducts());
            expect(products, equals(Right(tProductsModel)));
          });
          test('should return LocalFailure when there\'s NO saved data',
              () async {
            // arrange
            when(mockProductsLocalDataSource.getLocalProducts())
                .thenThrow(LocalException());
            // act
            final result = await repositoryImpl.getProducts();
            // assert
            verify(mockProductsLocalDataSource.getLocalProducts());
            expect(result, equals(Left(LocalFailure())));
          });
        },
      );
    });
  }

  void testGetProduct() {
    group('test get product', () {
      setUp(() {
        when(mockProductsLocalDataSource.saveProductLocally(any))
            .thenAnswer((_) async => true);
      });

      test('should check for internet connection', () async {
        // arrange
        when(mockInternetConnection.isConnected).thenAnswer((_) async => true);
        when(mockProductsRemoteDataSource.getProduct(tProductId))
            .thenAnswer((_) async => tProductModel);

        // act
        await repositoryImpl.getProduct(tProductId);
        // assert
        verify(mockInternetConnection.isConnected);
      });

      group(
        'device is online',
        () {
          setUp(() {
            when(mockInternetConnection.isConnected)
                .thenAnswer((_) async => true);
          });

          test('should return remote data when the call success', () async {
            // arrange
            when(mockProductsRemoteDataSource.getProduct(tProductId))
                .thenAnswer((_) async => tProductModel);
            // act
            final product = await repositoryImpl.getProduct(tProductId);
            // assert
            verify(mockProductsRemoteDataSource.getProduct(tProductId));
            verify(
                mockProductsLocalDataSource.saveProductLocally(tProductModel));
            expect(product, equals(Right(tProductModel)));
          });

          test('should return ServerFailure when the call fails', () async {
            // arrange
            when(mockProductsRemoteDataSource.getProduct(tProductId))
                .thenThrow(ServerException());
            // act
            final result = await repositoryImpl.getProduct(tProductId);
            // assert
            verify(mockProductsRemoteDataSource.getProduct(tProductId));
            expect(result, equals(Left(ServerFailure())));
          });
        },
      );

      group(
        'device is offline',
        () {
          setUp(() {
            when(mockInternetConnection.isConnected)
                .thenAnswer((_) async => false);
          });

          test('should return saved product when there\'s saved data',
              () async {
            // arrange
            when(mockProductsLocalDataSource.getLocalProduct(tProductId))
                .thenAnswer((_) async => tProductModel);
            // act
            final product = await repositoryImpl.getProduct(tProductId);
            // assert
            verify(mockProductsLocalDataSource.getLocalProduct(tProductId));
            expect(product, equals(Right(tProductModel)));
          });
          test('should return LocalFailure when there\'s NO saved data',
              () async {
            // arrange
            when(mockProductsLocalDataSource.getLocalProduct(tProductId))
                .thenThrow(LocalException());
            // act
            final result = await repositoryImpl.getProduct(tProductId);
            // assert
            verify(mockProductsLocalDataSource.getLocalProduct(tProductId));
            expect(result, equals(Left(LocalFailure())));
          });
        },
      );
    });
  }

  testGetProducts();
  testGetProduct();
}
