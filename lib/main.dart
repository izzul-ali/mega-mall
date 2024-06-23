import 'package:ecommerce/core/config/routes.dart';
import 'package:ecommerce/injection.dart' as di;
import 'package:ecommerce/presentation/bloc/auth/auth_bloc.dart';
import 'package:ecommerce/presentation/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/presentation/bloc/product/product_bloc.dart';
import 'package:ecommerce/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:ecommerce/core/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize dependency injection
  await di.initializeDependencies();

  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => di.locator<AuthBloc>()..add(AuthGetInfo()),
          ),
          BlocProvider(
            create: (context) => di.locator<ProductBloc>()..add(LoadProducts()),
          ),
          BlocProvider(
            create: (context) =>
                di.locator<WishlistBloc>()..add(LoadWishlist()),
          ),
          BlocProvider(
            create: (context) => di.locator<CartBloc>()..add(LoadCart()),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Mega Mall',
          theme: appThemeData(context),
          routerConfig: AppRoute.router,
        ),
      ),
    );
  }
}
