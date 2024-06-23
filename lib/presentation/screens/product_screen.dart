import 'package:ecommerce/presentation/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:ecommerce/data/model/product_model.dart';
import 'package:ecommerce/core/config/color.dart';
import 'package:ecommerce/presentation/widget/common/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class DetailProductScreen extends StatelessWidget {
  const DetailProductScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Detail Product',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/share.svg'),
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
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Image.network(
            product.image,
            width: MediaQuery.sizeOf(context).width - 40,
            height: 280,
          ),
          const SizedBox(height: 30),
          Text(
            product.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.price.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.redVelvet,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/rating.svg',
                    width: 14,
                    height: 14,
                    fit: BoxFit.scaleDown,
                  ),
                  const SizedBox(width: 1),
                  Text(product.rating.rate.toString()),
                  const SizedBox(width: 10),
                  Text(
                    '${product.rating.count.toString()} Reviews',
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.lightGreen,
                ),
                child: const Text(
                  'Tersedia : 260',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Divider(color: AppColor.softGrey),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
            leading: CircleAvatar(
              backgroundColor: AppColor.primary,
              child: const Text('LS', style: TextStyle(color: Colors.white)),
            ),
            title: const Text('Larson Shop'),
            subtitle: Row(
              children: [
                const Text('Official Store'),
                const SizedBox(width: 6),
                SvgPicture.asset('assets/icons/verified.svg'),
              ],
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),
          Divider(color: AppColor.softGrey),
          const SizedBox(height: 20),
          const SectionTitle(
            title: 'Description Product',
            titleFontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 15),
          Text(product.description),
          const SizedBox(height: 20),
          Divider(color: AppColor.softGrey),
          const SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: _renderBottomNavbar(context),
    );
  }

  Container _renderBottomNavbar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 10),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: AppColor.redVelvet,
              ),
              onPressed: () {
                context
                    .read<WishlistBloc>()
                    .add(AddToWishlist(product: product));
              },
              child: const Text(
                'Add to Wishlist',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: AppColor.primary,
              ),
              onPressed: () {
                BlocProvider.of<CartBloc>(context).add(
                  AddToCart(product: product),
                );
              },
              child: const Text(
                'Add to Cart',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
