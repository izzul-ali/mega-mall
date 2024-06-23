import 'package:ecommerce/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:ecommerce/core/config/color.dart';
import 'package:ecommerce/presentation/widget/components/product/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColor.softGrey,
      ),
      child: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistError) {
            return Center(
              child: Text(state.message ?? 'Something went wrong'),
            );
          }

          if (state is WishlistLoaded) {
            return state.products.isNotEmpty
                ? ListView(
                    children: [
                      GridView.builder(
                        itemCount: state.products.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 20,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1),
                        ),
                        itemBuilder: (context, index) => ProductCard(
                          product: state.products[index],
                          isWishlist: true,
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: Text('Opps!, add product to your wishlist first'),
                  );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
