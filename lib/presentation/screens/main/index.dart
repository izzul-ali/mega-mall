import 'package:ecommerce/presentation/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/presentation/screens/main/account_screen.dart';
import 'package:ecommerce/presentation/screens/main/history_screen.dart';
import 'package:ecommerce/presentation/screens/main/dashboard_screen.dart';
import 'package:ecommerce/core/config/color.dart';
import 'package:ecommerce/presentation/screens/main/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Mega Mall',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/bell.svg'),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              context.go('/cart');
            },
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return Badge(
                  isLabelVisible: state is CartLoaded && state.carts.isNotEmpty,
                  label: Text(
                    state is CartLoaded ? state.carts.length.toString() : '',
                    style: const TextStyle(fontSize: 10),
                  ),
                  child: SvgPicture.asset('assets/icons/chart.svg'),
                );
              },
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: const [
        DashboardScreen(),
        WishlistScreen(),
        HistoryScreen(),
        AccountScreen(),
      ][currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentTabIndex = value;
          });
        },
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(color: AppColor.primary),
        backgroundColor: Colors.white,
        items: [
          _renderTabIcon(path: 'assets/icons/house.svg', label: 'Home'),
          _renderTabIcon(path: 'assets/icons/heart.svg', label: 'Wishlist'),
          _renderTabIcon(path: 'assets/icons/bag.svg', label: 'History'),
          _renderTabIcon(path: 'assets/icons/user.svg', label: 'Account'),
        ],
      ),
    );
  }

  BottomNavigationBarItem _renderTabIcon(
      {required String path, required String label}) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        path,
        width: 20,
        height: 20,
        fit: BoxFit.scaleDown,
      ),
      label: label,
    );
  }
}
