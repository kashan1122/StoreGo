import 'package:flutter/material.dart';
import 'package:myapp/core/constants/app_font.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/core/responsive/size_extention.dart';

class PriceSection extends StatelessWidget {
  final BuildContext context;
  final dynamic price;
  const PriceSection(this.context, this.price, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          "₹ $price",
          fontSize: 20,
          fontFamily: AppFonts.montserratSemiBold,
        ),
        SizedBox(width: context.wp(2)),
        const CustomText(
          "₹2,999",
          decoration: TextDecoration.lineThrough,
          color: Colors.grey,
        ),
        SizedBox(width: context.wp(2)),
        const CustomText(
          "50% Off",
          color: Colors.redAccent,
        ),
      ],
    );
  }
}
