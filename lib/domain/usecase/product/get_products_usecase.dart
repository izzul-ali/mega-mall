import 'package:ecommerce/data/model/product_model.dart';
import 'package:ecommerce/domain/repository/product_repository.dart';

class GetProductsUsecase {
  final ProductRepository productRepository;

  GetProductsUsecase({required this.productRepository});

  Future<List<Product>> execute() async {
    return productRepository.getProducts();
  }
}
