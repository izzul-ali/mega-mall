import 'package:ecommerce/core/config/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    super.key,
    required this.bgColor,
    required this.pathIcon,
    required this.label,
  });

  final Color bgColor;
  final String pathIcon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: bgColor,
            ),
            child: SvgPicture.asset(
              pathIcon,
              width: 24,
              height: 24,
              fit: BoxFit.scaleDown,
              color: AppColor.primary,
            ),
          ),
          const SizedBox(height: 10),
          Text(label)
        ],
      ),
    );
  }
}
