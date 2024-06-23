import 'package:ecommerce/core/config/color.dart';
import 'package:ecommerce/presentation/widget/components/category/item_category.dart';
import 'package:ecommerce/presentation/widget/common/section_title.dart';
import 'package:flutter/material.dart';

class ListCategory extends StatelessWidget {
  const ListCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 400,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          SectionTitle(
            title: 'All Categories',
            titleFontWeight: FontWeight.bold,
            rightWidget: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close),
            ),
          ),
          const Divider(height: 20),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.sizeOf(context).width - 40,
            child: Wrap(
              spacing: 10,
              runSpacing: 30,
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceBetween,
              children: [
                ItemCategory(
                  bgColor: AppColor.lightGreen,
                  pathIcon: 'assets/icons/food.svg',
                  label: 'Foods',
                ),
                ItemCategory(
                  bgColor: AppColor.lightOrange,
                  pathIcon: 'assets/icons/gift-card.svg',
                  label: 'Gift',
                ),
                ItemCategory(
                  bgColor: AppColor.lightYellow,
                  pathIcon: 'assets/icons/fashion.svg',
                  label: 'Fashion',
                ),
                ItemCategory(
                  bgColor: AppColor.lightPurple,
                  pathIcon: 'assets/icons/computer.svg',
                  label: 'Computer',
                ),
                ItemCategory(
                  bgColor: AppColor.lightGreen,
                  pathIcon: 'assets/icons/accessories.svg',
                  label: 'Accessories',
                ),
                ItemCategory(
                  bgColor: AppColor.lightYellow,
                  pathIcon: 'assets/icons/fashion.svg',
                  label: 'Fashion',
                ),
                ItemCategory(
                  bgColor: AppColor.lightPurple,
                  pathIcon: 'assets/icons/computer.svg',
                  label: 'Computer',
                ),
                ItemCategory(
                  bgColor: AppColor.lightGreen,
                  pathIcon: 'assets/icons/food.svg',
                  label: 'Foods',
                ),
                ItemCategory(
                  bgColor: AppColor.lightOrange,
                  pathIcon: 'assets/icons/gift-card.svg',
                  label: 'Gift',
                ),
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
