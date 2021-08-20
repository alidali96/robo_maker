import 'dart:convert';

import 'package:clementoni/features/products/data/models/product_model.dart';
import 'package:clementoni/features/products/data/models/products_model.dart';
import 'package:clementoni/features/products/domain/entities/product.dart';
import 'package:clementoni/features/products/domain/entities/products.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tProductsModel = ProductsModel(list: [
    ProductModel(
      id: 59122,
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
    ),
    ProductModel(
      id: 59078,
      name: "RoboMaker PRO",
      category: "Robot",
      age: 10,
      price: 75.95,
      details: [
        "Die Welt der Roboter entdecken mit diesem großartigen Technologic-Set!",
        "Mehr als 250 Zubehörteile, darunter 1 kybernetisches Zentrum, 3 Elektromotoren, 2 IR Sensoren, 1 Lautsprecher und vieles mehr. Mit dem Set können 5 Roboter zusammengebaut werden, die manuell oder per App programmiert werden können.",
        "Durch die Infrarotsensoren können die Roboter Gegenstände in ihrer Umgebung wahrnehmen und mit den Fühlsensoren aufnehmen und woanders hintransportieren."
      ],
    ),
  ]);

  test(
    'should be a subclass of Products entity',
    () {
      expect(tProductsModel, isA<Products>());
    },
  );

  test(
    'should return a valid model from JSON',
    () {
      // arrange
      final json = fixture('products.json');
      // act
      final result = ProductsModel.fromJson(json);
      // assert
      expect(result, tProductsModel);
    },
  );

  test(
    'should return a valid JSON from model',
    () {
      // arrange
      final jsonData = json.encode(json.decode(fixture('products.json')));
      // act
      final jsonModel = tProductsModel.toJson();
      // assert
      expect(jsonData, jsonModel);
    },
  );
}
