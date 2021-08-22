import 'package:bloc_test/bloc_test.dart';
import 'package:clementoni/core/error/failures.dart';
import 'package:clementoni/features/products/domain/entities/product.dart';
import 'package:clementoni/features/products/domain/usecases/get_product.dart';
import 'package:clementoni/features/products/presentation/bloc/product/product_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'product_bloc_test.mocks.dart';

@GenerateMocks([GetProduct])
void main() {
  final mockGetProduct = MockGetProduct();

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

  blocTest<ProductBloc, ProductState>(
    'should emit [ProductLoading, ProductLoaded] when product is gotten successfully',
    build: () {
      when(mockGetProduct(any)).thenAnswer((_) async => Right(tProduct));
      return ProductBloc(getProduct: mockGetProduct);
    },
    act: (b) => b.add(LoadProduct(id: tProductId)),
    expect: () => [
      isA<ProductLoading>(),
      isA<ProductLoaded>(),
    ],
  );

  blocTest<ProductBloc, ProductState>(
    'should emit [ProductLoading, ProductFailure] when loading product fails',
    build: () {
      when(mockGetProduct(any)).thenAnswer((_) async => Left(ServerFailure()));
      return ProductBloc(getProduct: mockGetProduct);
    },
    act: (b) => b.add(LoadProduct(id: tProductId)),
    expect: () => [
      isA<ProductLoading>(),
      isA<ProductFailure>(),
    ],
  );
}
