import 'package:ecommerce/data/model/cart_model.dart';
import 'package:ecommerce/domain/repository/cart_repository.dart';

class DeleteCartsUsecase {
  final CartRepository cartRepository;

  DeleteCartsUsecase({required this.cartRepository});

  Future<List<Cart>> execute({required int productId}) async {
    return cartRepository.deleteCartItem(productId);
  }
}
