import 'package:ecommerce/data/model/cart_model.dart';
import 'package:ecommerce/domain/repository/cart_repository.dart';

class UpdateCartsUsecase {
  final CartRepository cartRepository;

  UpdateCartsUsecase({required this.cartRepository});

  Future<List<Cart>> execute(
      {required int productId, required bool isAdd}) async {
    return cartRepository.updateCartItemQty(productId, isAdd);
  }
}
