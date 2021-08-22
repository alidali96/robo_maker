import 'package:clementoni/core/error/exceptions.dart';
import 'package:dio/dio.dart';

import '../models/product_model.dart';
import '../models/products_model.dart';

abstract class ProductsRemoteDataSource {
  Future<ProductsModel> getProducts();
  Future<ProductModel> getProduct(int id);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final Dio dio;
  final apiURL = 'https://alidali.ca';
  final options = Options(
    headers: {
      Headers.contentTypeHeader: 'application/json',
    },
  );
  ProductsRemoteDataSourceImpl({required this.dio});

  @override
  Future<ProductModel> getProduct(int id) async {
    try {
      final response = await dio.get('$apiURL/products/$id', options: options);
      if (response.statusCode == 200) {
        return ProductModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } catch (error) {
      throw ServerException();
    }
  }

  @override
  Future<ProductsModel> getProducts() async {
    try {
      final response = await dio.get('$apiURL/products', options: options);
      if (response.statusCode == 200) {
        return ProductsModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } catch (error) {
      throw ServerException();
    }
  }
}
