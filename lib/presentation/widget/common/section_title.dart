import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.rightWidget,
    this.titleFontWeight = FontWeight.w500,
  });

  final String title;
  final FontWeight titleFontWeight;
  final Widget? rightWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: titleFontWeight,
            color: const Color(0xff0C1A30),
          ),
        ),
        rightWidget ?? const SizedBox.shrink(),
      ],
    );
  }
}
