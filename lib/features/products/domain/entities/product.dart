import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
@JsonSerializable()
class Product with _$Product {
  const factory Product({
    required int id,
    required String name,
    required String category,
    required int age,
    required double price,
    required List<String> details,
  }) = _Product;
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
