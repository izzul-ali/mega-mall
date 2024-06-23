part of 'product_bloc.dart';

@immutable
sealed class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

final class ProductLoading extends ProductState {
  @override
  List<Object> get props => [];
}

final class ProductError extends ProductState {
  final String? message;

  ProductError({this.message});

  @override
  List<Object> get props => [message ?? ''];
}

final class ProductLoaded extends ProductState {
  final List<Product> products;

  ProductLoaded({required this.products});

  @override
  List<Object> get props => [products];
}
