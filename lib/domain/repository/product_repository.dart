import 'package:ecommerce/data/model/product_model.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}
