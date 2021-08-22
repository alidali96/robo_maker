import 'package:shared_preferences/shared_preferences.dart';

import 'package:clementoni/features/products/data/models/product_model.dart';
import 'package:clementoni/features/products/data/models/products_model.dart';

abstract class ProductsLocalDataSource {
  Future<ProductsModel> getLocalProducts();
  Future<ProductModel> getLocalProduct(int id);
  Future<bool> saveProductsLocally(ProductsModel products);
  Future<bool> saveProductLocally(ProductModel product);
}

class ProductsLocalDataSourceImpl implements ProductsLocalDataSource {
  SharedPreferences sharedPreferences;
  ProductsLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  static const PRODUCT_KEY = 'PRODUCT-';
  static const PRODUCTS_KEY = 'PRODUCTS';

  String productKey(ProductModel productModel) =>
      PRODUCT_KEY + productModel.id.toString();

  @override
  Future<ProductModel> getLocalProduct(int id) async {
    // TODO: implement getLocalProduct
    throw UnimplementedError();
  }

  @override
  Future<ProductsModel> getLocalProducts() async {
    // TODO: implement getLocalProducts
    throw UnimplementedError();
  }

  @override
  Future<bool> saveProductLocally(ProductModel product) async {
    return sharedPreferences.setString(productKey(product), product.toJson());
  }

  @override
  Future<bool> saveProductsLocally(ProductsModel products) async {
    return sharedPreferences.setString(PRODUCTS_KEY, products.toJson());
  }
}
