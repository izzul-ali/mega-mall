import 'package:ecommerce/presentation/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:ecommerce/data/model/product_model.dart';
import 'package:ecommerce/core/config/color.dart';
import 'package:ecommerce/presentation/widget/common/app_button.dart';
import 'package:ecommerce/presentation/widget/common/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.isWishlist = false,
  });

  final Product product;
  final bool isWishlist;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {context.goNamed('product', extra: product)},
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image,
              height: 200,
              fit: BoxFit.contain,
            ),
            Expanded(child: const SizedBox(height: 20)),
            Text(
              product.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 2),
            Text(
              product.price.toString(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColor.redVelvet,
              ),
            ),
            const SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/rating.svg'),
                    const SizedBox(width: 3),
                    Text(
                      product.rating.rate.toString(),
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                Text(
                  '${product.rating.count.toString()} Reviews',
                  style: const TextStyle(fontSize: 10),
                ),
                isWishlist
                    ? GestureDetector(
                        onTap: () {
                          context
                              .read<WishlistBloc>()
                              .add(RemoveFromWishlist(productId: product.id));
                        },
                        child: const Icon(
                          Icons.restore_from_trash_outlined,
                          size: 18,
                        ))
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              enableDrag: true,
                              builder: (context) =>
                                  _bottomSheetMenuProductContent(context),
                            );
                          },
                          child: SvgPicture.asset(
                            'assets/icons/menu.svg',
                            width: 14,
                            height: 14,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _bottomSheetMenuProductContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 330,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(
            title: 'Product Action',
            titleFontWeight: FontWeight.bold,
            rightWidget: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close),
            ),
          ),
          const Divider(height: 20),
          const SizedBox(height: 15),
          SizedBox(
            width: MediaQuery.sizeOf(context).width - 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      context.read<WishlistBloc>().add(
                            AddToWishlist(product: product),
                          );
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Add to Wishlist',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )),
                const Divider(height: 50),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Share Product',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 30),
                AppButton(
                  title: 'Add to Cart',
                  onPress: () {
                    BlocProvider.of<CartBloc>(context).add(
                      AddToCart(product: product),
                    );
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
