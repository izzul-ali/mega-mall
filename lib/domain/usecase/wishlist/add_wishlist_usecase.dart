import 'package:ecommerce/data/model/product_model.dart';
import 'package:ecommerce/domain/repository/wishlist_repository.dart';

class AddWishlistUsecase {
  final WishlistRepository wishlistRepository;

  AddWishlistUsecase({required this.wishlistRepository});

  Future<List<Product>> execute(Product product) async {
    return wishlistRepository.addToWishlist(product);
  }
}
