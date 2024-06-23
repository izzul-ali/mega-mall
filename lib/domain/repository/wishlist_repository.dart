import 'package:ecommerce/data/model/product_model.dart';

abstract class WishlistRepository {
  Future<List<Product>> getWishlist();
  Future<List<Product>> addToWishlist(Product product);
  Future<List<Product>> deleteWishlistItem(int productId);
}
