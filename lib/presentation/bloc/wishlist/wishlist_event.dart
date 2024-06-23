part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadWishlist extends WishlistEvent {
  @override
  List<Object> get props => [];
}

class AddToWishlist extends WishlistEvent {
  final Product product;

  AddToWishlist({required this.product});

  @override
  List<Object> get props => [product];
}

class RemoveFromWishlist extends WishlistEvent {
  final int productId;

  RemoveFromWishlist({required this.productId});

  @override
  List<Object> get props => [productId];
}
