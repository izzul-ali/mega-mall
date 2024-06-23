import 'package:ecommerce/core/db/open_db.dart';
import 'package:ecommerce/data/datasource/auth/auth_local_datasource.dart';
import 'package:ecommerce/data/datasource/cart/cart_local_datasource.dart';
import 'package:ecommerce/data/datasource/product/product_remote_datasource.dart';
import 'package:ecommerce/data/repository/auth_repository_impl.dart';
import 'package:ecommerce/data/repository/cart_repository_impl.dart';
import 'package:ecommerce/data/repository/product_repository_impl.dart';
import 'package:ecommerce/data/repository/wishlist_repository_impl.dart';
import 'package:ecommerce/domain/repository/auth_repository.dart';
import 'package:ecommerce/domain/repository/cart_repository.dart';
import 'package:ecommerce/domain/repository/product_repository.dart';
import 'package:ecommerce/domain/repository/wishlist_repository.dart';
import 'package:ecommerce/domain/usecase/auth/auth_get_info_usecase.dart';
import 'package:ecommerce/domain/usecase/auth/auth_login_usecase.dart';
import 'package:ecommerce/domain/usecase/auth/auth_logout_usecase.dart';
import 'package:ecommerce/domain/usecase/cart/add_to_cart_usecase.dart';
import 'package:ecommerce/domain/usecase/cart/delete_cart_usecase.dart';
import 'package:ecommerce/domain/usecase/cart/get_carts_usecase.dart';
import 'package:ecommerce/domain/usecase/cart/update_cart_usecase.dart';
import 'package:ecommerce/domain/usecase/product/get_products_usecase.dart';
import 'package:ecommerce/domain/usecase/wishlist/add_wishlist_usecase.dart';
import 'package:ecommerce/domain/usecase/wishlist/delete_wishlist_usecase.dart';
import 'package:ecommerce/domain/usecase/wishlist/get_wishlist_usecase.dart';
import 'package:ecommerce/presentation/bloc/auth/auth_bloc.dart';
import 'package:ecommerce/presentation/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/presentation/bloc/product/product_bloc.dart';
import 'package:ecommerce/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

import 'data/datasource/wishlist/wishlist_local_datasource.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final Database db = await openDb();

  // Sqlite DB
  locator.registerSingleton<Database>(db);

  // ====================

  // Http
  locator.registerSingleton<http.Client>(http.Client());

  // ====================

  // datasource
  locator.registerSingleton<AuthLocalDatasource>(
      AuthLocalDatasource(db: locator()));
  locator.registerSingleton<ProductDatasource>(
      ProductDatasource(client: locator()));
  locator.registerSingleton<CartLocalDatasource>(
      CartLocalDatasource(db: locator()));
  locator.registerSingleton<WishlistLocalDatasource>(
      WishlistLocalDatasource(db: locator()));

// ====================

// repository
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authLocalDatasource: locator()));
  locator.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(productDatasource: locator()));
  locator.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(cartLocalDatasource: locator()));
  locator.registerLazySingleton<WishlistRepository>(
      () => WishlistRepositoryImpl(wishlistLocalDatasource: locator()));

  // ====================

  // usecase

  // Auth
  locator.registerLazySingleton(
      () => AuthGetInfoUsecase(authRepository: locator()));
  locator
      .registerLazySingleton(() => AuthLoginUsecase(authRepository: locator()));
  locator.registerLazySingleton(
      () => AuthLogoutUsecase(authRepository: locator()));

  // Product
  locator.registerLazySingleton(
      () => GetProductsUsecase(productRepository: locator()));

  // Cart
  locator
      .registerLazySingleton(() => GetCartsUsecase(cartRepository: locator()));
  locator
      .registerLazySingleton(() => AddToCartUsecase(cartRepository: locator()));
  locator.registerLazySingleton(
      () => UpdateCartsUsecase(cartRepository: locator()));
  locator.registerLazySingleton(
      () => DeleteCartsUsecase(cartRepository: locator()));
  // Wishlist
  locator.registerLazySingleton(
      () => AddWishlistUsecase(wishlistRepository: locator()));
  locator.registerLazySingleton(
      () => DeleteWishlistUsecase(wishlistRepository: locator()));
  locator.registerLazySingleton(
      () => GetWishlistUsecase(wishlistRepository: locator()));

  // ====================

  // bloc
  locator.registerFactory<AuthBloc>(() => AuthBloc(
        locator(),
        locator(),
        locator(),
      ));
  locator.registerFactory<ProductBloc>(() => ProductBloc(locator()));
  locator.registerFactory<WishlistBloc>(
    () => WishlistBloc(
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory<CartBloc>(
    () => CartBloc(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
}
