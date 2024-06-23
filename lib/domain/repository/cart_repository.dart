import 'package:ecommerce/data/model/cart_model.dart';
import 'package:ecommerce/data/model/product_model.dart';

abstract class CartRepository {
  Future<List<Cart>> getCarts();
  Future<List<Cart>> addToCart(Product product);
  Future<List<Cart>> updateCartItemQty(int productId, bool isAdd);
  Future<List<Cart>> deleteCartItem(int productId);
}
