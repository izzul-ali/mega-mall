import 'package:ecommerce/data/model/product_model.dart';
import 'package:ecommerce/presentation/bloc/product/product_bloc.dart';
import 'package:ecommerce/core/config/color.dart';
import 'package:ecommerce/presentation/widget/components/category/item_category.dart';
import 'package:ecommerce/presentation/widget/components/category/list_category.dart';
import 'package:ecommerce/presentation/widget/components/product/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/common/banner_carausel.dart';
import '../../widget/common/input_search.dart';
import '../../widget/common/section_title.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: InputSearch(
            onSearch: (txt) => BlocProvider.of<ProductBloc>(context).add(
              LoadProducts(query: txt),
            ),
          ),
        ),
        const SizedBox(height: 15),
        const BannerCarausel(),
        const SizedBox(height: 5),
        _categories(context),
        const SizedBox(height: 20),
        _productRecommended(context),
      ],
    );
  }

  Container _productRecommended(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppColor.offGrey,
      ),
      child: Column(
        children: [
          SectionTitle(
            title: 'Recommended',
            rightWidget: TextButton(
              onPressed: () {},
              child: const Text(
                'See All',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoaded) {
                return Column(
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
                      itemBuilder: (context, index) {
                        final Product product = state.products[index];

                        return ProductCard(
                          key: Key(product.id.toString()),
                          product: product,
                        );
                      },
                    ),
                  ],
                );
              }

              if (state is ProductError) {
                return Center(
                    child: Text(state.message ?? 'Something went wrong'));
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }

  Container _categories(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SectionTitle(
            title: 'Categories',
            rightWidget: TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  enableDrag: true,
                  builder: (context) => const ListCategory(),
                );
              },
              child: const Text(
                'See All',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ItemCategory(
                  bgColor: AppColor.lightGreen,
                  pathIcon: 'assets/icons/food.svg',
                  label: 'Foods',
                ),
                const SizedBox(width: 30),
                ItemCategory(
                  bgColor: AppColor.lightOrange,
                  pathIcon: 'assets/icons/gift-card.svg',
                  label: 'Gift',
                ),
                const SizedBox(width: 30),
                ItemCategory(
                  bgColor: AppColor.lightYellow,
                  pathIcon: 'assets/icons/fashion.svg',
                  label: 'Fashion',
                ),
                const SizedBox(width: 30),
                ItemCategory(
                  bgColor: AppColor.lightPurple,
                  pathIcon: 'assets/icons/computer.svg',
                  label: 'Computer',
                ),
                const SizedBox(width: 20),
                ItemCategory(
                  bgColor: AppColor.lightGreen,
                  pathIcon: 'assets/icons/accessories.svg',
                  label: 'Accessories',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
