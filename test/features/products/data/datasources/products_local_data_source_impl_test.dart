import 'package:clementoni/core/error/exceptions.dart';
import 'package:clementoni/core/error/failures.dart';
import 'package:clementoni/features/products/data/datasources/products_local_data_source.dart';
import 'package:clementoni/features/products/data/models/product_model.dart';
import 'package:clementoni/features/products/data/models/products_model.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'products_local_data_source_impl_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  final mockSharedPreferences = MockSharedPreferences();
  final productsLocalDataSourceImpl =
      ProductsLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);

  final tProductId = 59122;

  final tProductModel = ProductModel(
    id: tProductId,
    name: "RoboMaker Starter",
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

  group('saving data locally', () {
    test('save product locally', () async {
      when(mockSharedPreferences.setString(
              productsLocalDataSourceImpl.productKey(tProductModel.id), any))
          .thenAnswer((_) async => true);

      final saved =
          await productsLocalDataSourceImpl.saveProductLocally(tProductModel);

      verify(mockSharedPreferences.setString(
          productsLocalDataSourceImpl.productKey(tProductModel.id), any));
      expect(saved, true);
    });

    test('save products locally', () async {
      when(mockSharedPreferences.setString(
              ProductsLocalDataSourceImpl.PRODUCTS_KEY, any))
          .thenAnswer((_) async => true);

      final saved =
          await productsLocalDataSourceImpl.saveProductsLocally(tProductsModel);

      verify(mockSharedPreferences.setString(
          ProductsLocalDataSourceImpl.PRODUCTS_KEY, any));
      expect(saved, true);
    });
  });

  group('retrieving saved data', () {
    test('return saved product locally', () async {
      when(mockSharedPreferences
              .getString(productsLocalDataSourceImpl.productKey(tProductId)))
          .thenAnswer((_) => tProductModel.toJson());

      final product =
          await productsLocalDataSourceImpl.getLocalProduct(tProductId);

      verify(mockSharedPreferences
          .getString(productsLocalDataSourceImpl.productKey(tProductId)));
      expect(product, tProductModel);
    });

    test('return saved products locally', () async {
      when(mockSharedPreferences
              .getString(ProductsLocalDataSourceImpl.PRODUCTS_KEY))
          .thenAnswer((_) => tProductsModel.toJson());

      final products = await productsLocalDataSourceImpl.getLocalProducts();

      verify(mockSharedPreferences
          .getString(ProductsLocalDataSourceImpl.PRODUCTS_KEY));
      expect(products, tProductsModel);
    });

    test(
        'throws LocalException when no product with specified id is saved locally',
        () async {
      when(mockSharedPreferences
              .getString(productsLocalDataSourceImpl.productKey(tProductId)))
          .thenThrow(LocalException());

      final method =
          () => productsLocalDataSourceImpl.getLocalProduct(tProductId);

      expect(method, throwsA(TypeMatcher<LocalException>()));
    });

    test('throws LocalException when no products are saved locally', () async {
      when(mockSharedPreferences
              .getString(ProductsLocalDataSourceImpl.PRODUCTS_KEY))
          .thenThrow(LocalException());

      final method = () => productsLocalDataSourceImpl.getLocalProducts();

      expect(method, throwsA(TypeMatcher<LocalException>()));
    });
  });
}
