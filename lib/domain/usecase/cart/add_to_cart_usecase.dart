import 'package:ecommerce/data/model/cart_model.dart';
import 'package:ecommerce/data/model/product_model.dart';
import 'package:ecommerce/domain/repository/cart_repository.dart';

class AddToCartUsecase {
  final CartRepository cartRepository;

  AddToCartUsecase({required this.cartRepository});

  Future<List<Cart>> execute(Product product) async {
    return cartRepository.addToCart(product);
  }
}
