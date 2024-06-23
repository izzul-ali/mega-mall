import 'package:ecommerce/data/model/cart_model.dart';
import 'package:ecommerce/domain/repository/cart_repository.dart';

class GetCartsUsecase {
  final CartRepository cartRepository;

  GetCartsUsecase({required this.cartRepository});

  Future<List<Cart>> execute() async {
    return cartRepository.getCarts();
  }
}
