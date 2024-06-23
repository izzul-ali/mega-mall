part of 'product_bloc.dart';

@immutable
sealed class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductEvent {
  final String query;

  LoadProducts({this.query = ''});

  @override
  List<Object> get props => [query];
}

class LoadDetailProduct extends ProductEvent {
  @override
  List<Object> get props => [];
}
