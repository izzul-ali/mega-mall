import 'dart:convert';

import 'package:ecommerce/data/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductDatasource {
  final http.Client client;

  ProductDatasource({required this.client});

  // fetch product data from api
  Future<List<Product>> getProducts() async {
    final resp =
        await client.get(Uri.parse('https://fakestoreapi.com/products'));

    List<Product> products = [];

    if (resp.statusCode == 200) {
      final List<dynamic> data = jsonDecode(resp.body);

      for (var item in data) {
        products.add(Product.fromMap(item));
      }
    }

    return products;
  }
}
