// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'product.freezed.dart';
// part 'product.g.dart';

// @freezed
// @JsonSerializable()
// class Product with _$Product {
//   const factory Product({
//     required int id,
//     required String name,
//     required String category,
//     required int age,
//     required double price,
//     required List<String> details,
//   }) = _Product;
//   factory Product.fromJson(Map<String, dynamic> json) =>
//       _$ProductFromJson(json);
// }

import 'dart:convert';

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String category;
  final int age;
  final double price;
  final List<String> details;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.age,
    required this.price,
    required this.details,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      category,
      age,
      price,
      details,
    ];
  }

  Product copyWith({
    int? id,
    String? name,
    String? category,
    int? age,
    double? price,
    List<String>? details,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      age: age ?? this.age,
      price: price ?? this.price,
      details: details ?? this.details,
    );
  }

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

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      category: map['category'],
      age: map['age'],
      price: map['price'],
      details: List<String>.from(map['details']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  bool get stringify => true;
}
