part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthLoadingLogout extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthLoaded extends AuthState {
  final Auth? auth;

  const AuthLoaded({this.auth});

  @override
  List<Object> get props =>
      [auth ?? Auth(emailOrPhoneNumber: '', password: '')];
}

final class AuthError extends AuthState {
  final String message;

  const AuthError({this.message = ''});

  @override
  List<Object> get props => [message];
}
