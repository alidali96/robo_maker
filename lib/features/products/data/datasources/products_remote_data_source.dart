import '../models/product_model.dart';
import '../models/products_model.dart';

abstract class ProductsRemoteDataSource {
  Future<ProductsModel> getProducts();
  Future<ProductModel> getProduct(int id);
}
