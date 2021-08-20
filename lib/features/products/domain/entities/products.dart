import 'package:freezed_annotation/freezed_annotation.dart';

import 'product.dart';

part 'products.freezed.dart';
part 'products.g.dart';

@freezed
@JsonSerializable()
class Products with _$Products {
  const factory Products({required List<Product> list}) = _Products;
  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);
}
