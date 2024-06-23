import 'package:ecommerce/data/model/auth_model.dart';
import 'package:sqflite/sqflite.dart';

class AuthLocalDatasource {
  final Database db;

  AuthLocalDatasource({required this.db});

  Future<Auth?> getAuthInfo() async {
    final result = await db.query('auth');

    print('hasil ' + result.toString());

    if (result.isNotEmpty) {
      return Auth.fromMap(result[0]);
    }

    return null;
  }

  Future<void> login(Auth credential) async {
    await db.insert('auth', credential.toMap());
  }

  Future<void> logout(String emailOrPhoneNumber) async {
    await db.delete(
      'auth',
      where: 'emailOrPhoneNumber = ?',
      whereArgs: [emailOrPhoneNumber],
    );
  }
}
