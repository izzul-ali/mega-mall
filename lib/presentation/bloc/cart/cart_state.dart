part of 'cart_bloc.dart';

@immutable
sealed class CartState extends Equatable {
  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

final class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

final class CartLoaded extends CartState {
  final List<Cart> carts;

  CartLoaded({required this.carts});

  @override
  List<Object> get props => [carts];
}

final class CartError extends CartState {
  final String message;

  CartError({this.message = ''});

  @override
  List<Object> get props => [message];
}
