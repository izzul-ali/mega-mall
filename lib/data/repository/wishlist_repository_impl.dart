import 'package:ecommerce/data/datasource/wishlist/wishlist_local_datasource.dart';
import 'package:ecommerce/data/model/product_model.dart';
import 'package:ecommerce/domain/repository/wishlist_repository.dart';

// implementation of the abstract wishlist repository
class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistLocalDatasource wishlistLocalDatasource;

  WishlistRepositoryImpl({required this.wishlistLocalDatasource});

  @override
  Future<List<Product>> addToWishlist(Product product) async {
    await wishlistLocalDatasource.addToWishlist(product);

    final result = await wishlistLocalDatasource.getWishlist();

    return result;
  }

  @override
  Future<List<Product>> deleteWishlistItem(int productId) async {
    await wishlistLocalDatasource.deleteWishlistItem(productId);

    final result = await wishlistLocalDatasource.getWishlist();

    return result;
  }

  @override
  Future<List<Product>> getWishlist() async {
    final result = await wishlistLocalDatasource.getWishlist();

    return result;
  }
}
