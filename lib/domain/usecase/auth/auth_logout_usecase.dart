import 'package:ecommerce/domain/repository/auth_repository.dart';

class AuthLogoutUsecase {
  final AuthRepository authRepository;

  AuthLogoutUsecase({required this.authRepository});

  Future<void> execute(String emailOrPhoneNumber) async {
    return authRepository.logout(emailOrPhoneNumber);
  }
}
