import 'package:ecommerce/data/datasource/product/product_remote_datasource.dart';
import 'package:ecommerce/data/model/product_model.dart';
import 'package:ecommerce/domain/repository/product_repository.dart';

// implementation of the abstract product repository
class ProductRepositoryImpl implements ProductRepository {
  final ProductDatasource productDatasource;

  ProductRepositoryImpl({required this.productDatasource});

  @override
  Future<List<Product>> getProducts() async {
    final result = await productDatasource.getProducts();

    return result;
  }
}
