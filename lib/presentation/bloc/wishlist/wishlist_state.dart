part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState extends Equatable {
  @override
  List<Object> get props => [];
}

final class WishlistInitial extends WishlistState {
  @override
  List<Object> get props => [];
}

final class WishlistLoading extends WishlistState {
  @override
  List<Object> get props => [];
}

final class WishlistLoaded extends WishlistState {
  final List<Product> products;

  WishlistLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

final class WishlistError extends WishlistState {
  final String? message;

  WishlistError({this.message});

  @override
  List<Object> get props => [message ?? ''];
}
