import 'dart:convert';

import '../../domain/entities/products.dart';
import 'product_model.dart';

class ProductsModel extends Products {
  final List<ProductModel> list;
  ProductsModel({required this.list}) : super(list: list);

  Map<String, dynamic> toMap() {
    return {
      'list': list.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      list: List<ProductModel>.from(
          map['list']?.map((x) => ProductModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsModel.fromJson(String source) =>
      ProductsModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;
}
