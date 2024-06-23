import 'package:ecommerce/data/model/product_model.dart';
import 'package:ecommerce/domain/usecase/product/get_products_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUsecase getProductsUsecase;

  ProductBloc(this.getProductsUsecase) : super(ProductInitial()) {
    on<LoadProducts>((event, emit) async {
      emit(ProductLoading());

      try {
        final products = await getProductsUsecase.execute();

        if (event.query.isNotEmpty) {
          final filteredProducts = products
              .where((product) => product.title
                  .toLowerCase()
                  .contains(event.query.toLowerCase()))
              .toList();

          emit(ProductLoaded(products: filteredProducts));
          return;
        }

        emit(ProductLoaded(products: products));
      } catch (e) {
        emit(ProductError(message: e.toString()));
      }
    });
  }
}
