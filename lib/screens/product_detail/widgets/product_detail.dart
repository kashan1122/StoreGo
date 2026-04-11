import 'package:flutter/material.dart';
import 'package:myapp/core/constants/app_font.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/core/responsive/size_extention.dart';

class ProductDetails extends StatelessWidget {
  final BuildContext context;
  final String description;
  const ProductDetails(this.context, this.description, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          "Product Details",
          fontSize: 16,
          fontFamily: AppFonts.montserratSemiBold,
        ),
        SizedBox(height: context.hp(1)),
        CustomText(
          description,
          maxLines: 3,
          color: Colors.grey,
        ),
      ],
    );
  }
}
