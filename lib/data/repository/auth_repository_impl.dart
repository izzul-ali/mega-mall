import 'package:ecommerce/data/datasource/auth/auth_local_datasource.dart';
import 'package:ecommerce/data/model/auth_model.dart';
import 'package:ecommerce/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDatasource authLocalDatasource;

  AuthRepositoryImpl({required this.authLocalDatasource});

  @override
  Future<Auth?> getAuthInfo() async {
    final auth = await authLocalDatasource.getAuthInfo();

    return auth;
  }

  @override
  Future<Auth?> login(Auth credential) async {
    await authLocalDatasource.login(credential);

    final auth = await authLocalDatasource.getAuthInfo();

    return auth;
  }

  @override
  Future<void> logout(String emailOrPhoneNumber) async {
    await authLocalDatasource.logout(emailOrPhoneNumber);
  }
}
