import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'product.dart';

// part 'products.freezed.dart';
// part 'products.g.dart';

// @freezed
// @JsonSerializable()
// class Products with _$Products {
//   const factory Products({required List<Product> list}) = _Products;
//   factory Products.fromJson(Map<String, dynamic> json) =>
//       _$ProductsFromJson(json);
// }

class Products extends Equatable {
  final List<Product> list;

  Products({
    required this.list,
  });

  @override
  List<Object> get props => [list];
}
