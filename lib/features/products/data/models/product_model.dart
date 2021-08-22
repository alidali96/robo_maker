import 'dart:convert';

import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required int id,
    required String name,
    required String category,
    required int age,
    required double price,
    required List<String> details,
  }) : super(
            id: id,
            name: name,
            category: category,
            age: age,
            price: price,
            details: details);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'age': age,
      'price': price,
      'details': details,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      category: map['category'],
      age: map['age'],
      price: map['price'],
      details: map['details'] != null ? List<String>.from(map['details']) : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;
}
