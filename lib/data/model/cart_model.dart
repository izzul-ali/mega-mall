import 'package:ecommerce/data/model/product_model.dart';

class Cart {
  final Product product;
  final int cartQty;
  final double totalPrice;

  Cart({
    required this.totalPrice,
    required this.product,
    required this.cartQty,
  });
}
