import 'package:clementoni/features/products/data/models/products_model.dart';

abstract class ProductsLocalDataSource {
  Future<ProductsModel> getLocalProducts();
  Future<bool> saveProductsLocally(ProductsModel products);
}
