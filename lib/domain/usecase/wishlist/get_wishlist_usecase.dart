import 'package:ecommerce/data/model/product_model.dart';
import 'package:ecommerce/domain/repository/wishlist_repository.dart';

class GetWishlistUsecase {
  final WishlistRepository wishlistRepository;

  GetWishlistUsecase({required this.wishlistRepository});

  Future<List<Product>> execute() async {
    return wishlistRepository.getWishlist();
  }
}
