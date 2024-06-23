part of 'cart_bloc.dart';

@immutable
sealed class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {
  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  final Product product;

  AddToCart({required this.product});

  @override
  List<Object> get props => [product];
}

class UpdateCart extends CartEvent {
  final int productId;
  final bool isAdd;

  UpdateCart({required this.productId, required this.isAdd});

  @override
  List<Object> get props => [productId, isAdd];
}

class RemoveFromCart extends CartEvent {
  final int productId;

  RemoveFromCart({required this.productId});

  @override
  List<Object> get props => [productId];
}
