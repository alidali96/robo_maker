import 'dart:convert';

import 'package:clementoni/features/products/data/models/product_model.dart';
import 'package:clementoni/features/products/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tProductModel = ProductModel(
    id: 59122,
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

  test(
    'should be a subclass of Product entity',
    () {
      expect(tProductModel, isA<Product>());
    },
  );

  test(
    'should return a valid model from JSON',
    () {
      // arrange
      final json = fixture('product.json');
      // act
      final result = ProductModel.fromJson(json);
      // assert
      expect(result, tProductModel);
    },
  );

  test(
    'should return a valid JSON from model',
    () {
      // arrange
      final jsonData = json.encode(json.decode(fixture('product.json')));
      // act
      final jsonModel = tProductModel.toJson();
      // assert
      expect(jsonData, jsonModel);
    },
  );
}
