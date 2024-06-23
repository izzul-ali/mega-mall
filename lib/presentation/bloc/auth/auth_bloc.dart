import 'dart:async';

import 'package:ecommerce/data/model/auth_model.dart';
import 'package:ecommerce/domain/usecase/auth/auth_get_info_usecase.dart';
import 'package:ecommerce/domain/usecase/auth/auth_login_usecase.dart';
import 'package:ecommerce/domain/usecase/auth/auth_logout_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthGetInfoUsecase authGetInfoUsecase;
  final AuthLoginUsecase authLoginUsecase;
  final AuthLogoutUsecase authLogoutUsecase;

  AuthBloc(
      this.authGetInfoUsecase, this.authLoginUsecase, this.authLogoutUsecase)
      : super(AuthInitial()) {
    on<AuthGetInfo>(_onGetInfo);
    on<AuthLogin>(_onLogin);
    on<AuthLogout>(_onLogout);
  }

  FutureOr<void> _onGetInfo(AuthGetInfo event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());

      final result = await authGetInfoUsecase.execute();

      emit(AuthLoaded(auth: result));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  FutureOr<void> _onLogin(AuthLogin event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());

      final result = await authLoginUsecase.execute(event.auth);

      emit(AuthLoaded(auth: result));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  FutureOr<void> _onLogout(AuthLogout event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoadingLogout());

      await authLogoutUsecase.execute(event.emailOrPhoneNumber);

      emit(const AuthLoaded(auth: null));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
