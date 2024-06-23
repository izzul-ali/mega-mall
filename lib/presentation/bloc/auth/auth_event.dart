part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthGetInfo extends AuthEvent {
  @override
  List<Object> get props => [];
}

class AuthLogin extends AuthEvent {
  final Auth auth;

  const AuthLogin({required this.auth});

  @override
  List<Object> get props => [auth];
}

class AuthLogout extends AuthEvent {
  final String emailOrPhoneNumber;

  const AuthLogout({required this.emailOrPhoneNumber});

  @override
  List<Object> get props => [emailOrPhoneNumber];
}
