import 'package:clementoni/features/products/data/models/product_model.dart';
import 'package:clementoni/features/products/data/models/products_model.dart';

abstract class ProductsLocalDataSource {
  Future<ProductsModel> getLocalProducts();
  Future<ProductModel> getLocalProduct(int id);
  Future<bool> saveProductsLocally(ProductsModel products);
  Future<bool> saveProductLocally(ProductModel product);
}
