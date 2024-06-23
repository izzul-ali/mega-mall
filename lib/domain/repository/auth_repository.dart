import 'package:ecommerce/data/model/auth_model.dart';

abstract class AuthRepository {
  Future<Auth?> getAuthInfo();
  Future<Auth?> login(Auth credential);
  Future<void> logout(String emailOrPhoneNumber);
}
