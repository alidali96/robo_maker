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

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String image;
  final String category;
  final int age;
  final double price;
  final List<String> details;

  Product({
    required this.id,
    required this.name,
    required this.image,
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
      image,
      category,
      age,
      price,
      details,
    ];
  }
}
