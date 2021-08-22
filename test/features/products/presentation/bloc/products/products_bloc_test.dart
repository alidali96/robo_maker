import 'package:bloc_test/bloc_test.dart';
import 'package:clementoni/core/error/failures.dart';
import 'package:clementoni/features/products/domain/entities/product.dart';
import 'package:clementoni/features/products/domain/entities/products.dart';
import 'package:clementoni/features/products/domain/usecases/get_products.dart';
import 'package:clementoni/features/products/presentation/bloc/products/products_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'products_bloc_test.mocks.dart';

@GenerateMocks([GetProducts])
void main() {
  final mockGetProducts = MockGetProducts();

  final tProductId = 59122;

  final tProduct = Product(
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

  final tProducts = Products(list: [tProduct]);

  blocTest<ProductsBloc, ProductsState>(
    'should emit [ProductsLoading, ProductsLoaded] when products are gotten successfully',
    build: () {
      when(mockGetProducts(any)).thenAnswer((_) async => Right(tProducts));
      return ProductsBloc(getProducts: mockGetProducts);
    },
    act: (b) => b.add(LoadProducts()),
    expect: () => [
      isA<ProductsLoading>(),
      isA<ProductsLoaded>(),
    ],
  );

  blocTest<ProductsBloc, ProductsState>(
    'should emit [ProductsLoading, ProductsFailure] when loading products fails',
    build: () {
      when(mockGetProducts(any)).thenAnswer((_) async => Left(ServerFailure()));
      return ProductsBloc(getProducts: mockGetProducts);
    },
    act: (b) => b.add(LoadProducts()),
    expect: () => [
      isA<ProductsLoading>(),
      isA<ProductsFailure>(),
    ],
  );
}
