import 'package:ecommerce/data/model/cart_model.dart';
import 'package:ecommerce/data/model/product_model.dart';
import 'package:ecommerce/domain/usecase/cart/add_to_cart_usecase.dart';
import 'package:ecommerce/domain/usecase/cart/delete_cart_usecase.dart';
import 'package:ecommerce/domain/usecase/cart/get_carts_usecase.dart';
import 'package:ecommerce/domain/usecase/cart/update_cart_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartsUsecase getCartsUsecase;
  final AddToCartUsecase addToCartUsecase;
  final UpdateCartsUsecase updateCartsUsecase;
  final DeleteCartsUsecase deleteCartsUsecase;

  CartBloc(
    this.getCartsUsecase,
    this.addToCartUsecase,
    this.updateCartsUsecase,
    this.deleteCartsUsecase,
  ) : super(CartInitial()) {
    on<LoadCart>(_onLoadCart);
    on<AddToCart>(_onAddToCart);
    on<UpdateCart>(_onUpdateCart);
    on<RemoveFromCart>(_onRemoveCart);
  }

  Future<void> _onAddToCart(AddToCart event, Emitter<CartState> emit) async {
    try {
      emit(CartLoading());

      final result = await addToCartUsecase.execute(event.product);

      emit(CartLoaded(carts: result));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    try {
      emit(CartLoading());

      final list = await getCartsUsecase.execute();

      emit(CartLoaded(carts: list));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> _onUpdateCart(UpdateCart event, Emitter<CartState> emit) async {
    try {
      emit(CartLoading());

      final list = await updateCartsUsecase.execute(
        productId: event.productId,
        isAdd: event.isAdd,
      );

      emit(CartLoaded(carts: list));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> _onRemoveCart(
      RemoveFromCart event, Emitter<CartState> emit) async {
    try {
      emit(CartLoading());

      final list = await deleteCartsUsecase.execute(
        productId: event.productId,
      );

      emit(CartLoaded(carts: list));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }
}
