import 'package:ecommerce/data/model/product_model.dart';
import 'package:ecommerce/domain/usecase/wishlist/add_wishlist_usecase.dart';
import 'package:ecommerce/domain/usecase/wishlist/delete_wishlist_usecase.dart';
import 'package:ecommerce/domain/usecase/wishlist/get_wishlist_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final GetWishlistUsecase getWishlistUsecase;
  final AddWishlistUsecase addWishlistUsecase;
  final DeleteWishlistUsecase deleteWishlistUsecase;

  WishlistBloc(this.getWishlistUsecase, this.addWishlistUsecase,
      this.deleteWishlistUsecase)
      : super(WishlistInitial()) {
    on<LoadWishlist>(_onLoadWishlist);
    on<AddToWishlist>(_onAddToWishlist);
    on<RemoveFromWishlist>(_onRemoveWishlist);
  }

  Future<void> _onAddToWishlist(
      AddToWishlist event, Emitter<WishlistState> emit) async {
    try {
      emit(WishlistLoading());

      final result = await addWishlistUsecase.execute(event.product);

      emit(WishlistLoaded(products: result));
    } catch (e) {
      emit(WishlistError(message: e.toString()));
    }
  }

  Future<void> _onLoadWishlist(
      LoadWishlist event, Emitter<WishlistState> emit) async {
    try {
      emit(WishlistLoading());

      final result = await getWishlistUsecase.execute();

      emit(WishlistLoaded(products: result));
    } catch (e) {
      emit(WishlistError(message: e.toString()));
    }
  }

  Future<void> _onRemoveWishlist(
      RemoveFromWishlist event, Emitter<WishlistState> emit) async {
    try {
      emit(WishlistLoading());

      final result = await deleteWishlistUsecase.execute(event.productId);

      emit(WishlistLoaded(products: result));
    } catch (e) {
      emit(WishlistError(message: e.toString()));
    }
  }
}
