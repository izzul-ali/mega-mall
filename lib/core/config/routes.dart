import 'package:ecommerce/data/model/product_model.dart';
import 'package:ecommerce/presentation/screens/cart_screen.dart';
import 'package:ecommerce/presentation/screens/login_screen.dart';
import 'package:ecommerce/presentation/screens/main/index.dart';
import 'package:ecommerce/presentation/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'product',
          name: 'product',
          builder: (BuildContext context, GoRouterState state) {
            final Product product = state.extra as Product;

            return DetailProductScreen(product: product);
          },
        ),
        GoRoute(
          path: 'cart',
          name: 'cart',
          builder: (BuildContext context, GoRouterState state) {
            return const CartScreen();
          },
        ),
        GoRoute(
          path: 'login',
          name: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),
      ],
    ),
  ]);
}
