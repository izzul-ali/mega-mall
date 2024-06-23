import 'package:ecommerce/data/model/product_model.dart';

abstract class AddressRepository {
  Future<List<Product>> getAddress();
  Future<List<Product>> addAddress();
  Future<List<Product>> updateAddress();
  Future<List<Product>> deleteAddress();
}
