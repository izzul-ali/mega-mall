import 'package:ecommerce/data/model/auth_model.dart';
import 'package:ecommerce/domain/repository/auth_repository.dart';

class AuthLoginUsecase {
  final AuthRepository authRepository;

  AuthLoginUsecase({required this.authRepository});

  Future<Auth?> execute(Auth credential) async {
    return authRepository.login(credential);
  }
}
