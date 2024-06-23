import 'dart:convert';

import 'package:ecommerce/data/model/cart_model.dart';
import 'package:ecommerce/data/model/product_model.dart';
import 'package:sqflite/sqflite.dart';

class CartLocalDatasource {
  final Database db;

  CartLocalDatasource({required this.db});

  // retrieve carts data from local sqlite database
  Future<List<Cart>> getCartList() async {
    final list = await db.query('cart');

    final List<Cart> carts = [
      for (var item in list)
        Cart(
          totalPrice: (item['totalPrice'] as double).round().toDouble(),
          product: Product.fromMap(item),
          cartQty: (item['cartQty'] as int),
        )
    ];

    return carts;
  }

  // When adding an item to the cart, make sure the item isn't already in it,
  // even if the item is already there, we just need to add the number of items and recalculate the total price.
  Future<void> addToCart(Product product) async {
    final result =
        await db.query('cart', where: "id = ?", whereArgs: [product.id]);

    if (result.isEmpty) {
      final data = {
        ...product.toMap(),
        'rating': jsonEncode(product.rating.toMap()),
        'cartQty': 1,
        'totalPrice': product.price,
      };

      await db.insert('cart', data);
    } else {
      final exitingProduct = result[0];
      final qty = (exitingProduct['cartQty'] as int) + 1;
      final totalPrice = (exitingProduct['price'] as double) * qty;

      await db.update(
        'cart',
        {
          'cartQty': qty,
          'totalPrice': totalPrice,
        },
        where: "id = ?",
        whereArgs: [product.id],
      );
    }
  }

  // change the number of items and recalculate the total price
  Future<void> updateCartItemQty(int productId, bool isAdd) async {
    final result = await db.query(
      'cart',
      where: "id = ?",
      whereArgs: [productId],
    );

    if (result.isNotEmpty) {
      final exitingProduct = result[0];
      final qty = (exitingProduct['cartQty'] as int);
      final price = (exitingProduct['price'] as double);

      int newQty = isAdd ? qty + 1 : qty - 1;

      if (newQty <= 1) {
        newQty = 1;
      }

      await db.update(
        'cart',
        {
          'cartQty': newQty,
          'totalPrice': price * newQty,
        },
        where: "id = ?",
        whereArgs: [productId],
      );
    }
  }

  Future<void> deleteCart(int productId) async {
    await db.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [productId],
    );
  }
}
