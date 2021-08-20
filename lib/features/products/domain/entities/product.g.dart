// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as int,
    name: json['name'] as String,
    category: json['category'] as String,
    age: json['age'] as int,
    price: (json['price'] as num).toDouble(),
    details:
        (json['details'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'age': instance.age,
      'price': instance.price,
      'details': instance.details,
    };
