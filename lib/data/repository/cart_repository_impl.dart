import 'package:ecommerce/data/datasource/cart/cart_local_datasource.dart';
import 'package:ecommerce/data/model/cart_model.dart';
import 'package:ecommerce/data/model/product_model.dart';
import 'package:ecommerce/domain/repository/cart_repository.dart';

// implementation of the abstract cart repository
class CartRepositoryImpl implements CartRepository {
  final CartLocalDatasource cartLocalDatasource;

  CartRepositoryImpl({required this.cartLocalDatasource});

  @override
  Future<List<Cart>> getCarts() async {
    final result = await cartLocalDatasource.getCartList();

    return result;
  }

  @override
  Future<List<Cart>> addToCart(Product product) async {
    await cartLocalDatasource.addToCart(product);

    final result = await cartLocalDatasource.getCartList();

    return result;
  }

  @override
  Future<List<Cart>> deleteCartItem(int productId) async {
    await cartLocalDatasource.deleteCart(productId);

    final result = await cartLocalDatasource.getCartList();

    return result;
  }

  @override
  Future<List<Cart>> updateCartItemQty(int productId, bool isAdd) async {
    await cartLocalDatasource.updateCartItemQty(productId, isAdd);

    final result = await cartLocalDatasource.getCartList();

    return result;
  }
}
