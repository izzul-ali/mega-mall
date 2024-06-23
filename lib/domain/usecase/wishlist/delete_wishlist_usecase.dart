import 'package:ecommerce/data/model/product_model.dart';
import 'package:ecommerce/domain/repository/wishlist_repository.dart';

class DeleteWishlistUsecase {
  final WishlistRepository wishlistRepository;

  DeleteWishlistUsecase({required this.wishlistRepository});

  Future<List<Product>> execute(int productId) async {
    return wishlistRepository.deleteWishlistItem(productId);
  }
}
