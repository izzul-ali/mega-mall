import 'dart:convert';

import 'package:ecommerce/data/model/product_model.dart';
import 'package:sqflite/sqflite.dart';

class WishlistLocalDatasource {
  final Database db;

  WishlistLocalDatasource({required this.db});

  // retrieve wishlist data from local SQLite database
  Future<List<Product>> getWishlist() async {
    final list = await db.query('wishlist');

    final List<Product> products = [
      for (var item in list) Product.fromMap(item)
    ];

    return products;
  }

  Future<void> addToWishlist(Product product) async {
    final result =
        await db.query('wishlist', where: "id = ?", whereArgs: [product.id]);

    if (result.isEmpty) {
      final data = {
        ...product.toMap(),
        'rating': jsonEncode(product.rating.toMap()),
      };

      await db.insert('wishlist', data);
    }
  }

  Future<void> deleteWishlistItem(int productId) async {
    await db.delete(
      'wishlist',
      where: 'id = ?',
      whereArgs: [productId],
    );
  }
}
