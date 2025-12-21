import 'package:flutter/material.dart';
import 'package:myapp/core/constants/app_font.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/core/responsive/size_extention.dart';

class ProductInfo extends StatelessWidget {
  final BuildContext context;
  const ProductInfo(this.context, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          "Nike Sneakers",
          fontSize: 20,
          fontFamily: AppFonts.montserratSemiBold,
        ),
        SizedBox(height: context.hp(0.5)),
        const CustomText(
          "Vision Alta Men’s Shoes Size (All Colours)",
          fontSize: 14,
          color: Colors.grey,
        ),
        SizedBox(height: context.hp(1)),
        const Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 16),
            CustomText(" 4.5  "),
            CustomText("56,890", color: Colors.grey),
          ],
        ),
      ],
    );
  }
}
