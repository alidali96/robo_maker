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
class PP extends Equatable {
  final String test;
  PP({
    required this.test,
  });
  @override
  List<Object?> get props => [test];
}

class Products extends Equatable {
  final List<Product> list;

  Products({
    required this.list,
  });

  @override
  List<Object> get props => [list];

  Products copyWith({
    List<Product>? list,
  }) {
    return Products(
      list: list ?? this.list,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'list': list.map((x) => x.toMap()).toList(),
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      list: List<Product>.from(map['list']?.map((x) => Product.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) =>
      Products.fromMap(json.decode(source));

  @override
  bool get stringify => true;
}
