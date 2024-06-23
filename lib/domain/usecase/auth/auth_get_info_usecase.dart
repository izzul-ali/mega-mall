import 'package:ecommerce/data/model/auth_model.dart';
import 'package:ecommerce/domain/repository/auth_repository.dart';

class AuthGetInfoUsecase {
  final AuthRepository authRepository;

  AuthGetInfoUsecase({required this.authRepository});

  Future<Auth?> execute() async {
    return authRepository.getAuthInfo();
  }
}
