import 'package:flutter/material.dart';
import 'package:myapp/core/constants/app_colors.dart';
import 'package:myapp/core/constants/app_font.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/core/responsive/size_extention.dart';

class SizeSelector extends StatelessWidget {
  final BuildContext context;
  const SizeSelector(this.context, {super.key});

  @override
  Widget build(BuildContext context) {
    final sizes = ['6 UK', '7 UK', '8 UK', '9 UK', '10 UK'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          "Size: 7UK",
          fontSize: 14,
          fontFamily: AppFonts.montserratSemiBold,
        ),
        SizedBox(height: context.hp(1)),
        Wrap(
          spacing: context.wp(2),
          children: sizes.map((size) {
            final isSelected = size == '7 UK';
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.wp(4),
                vertical: context.hp(1),
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.background : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.background),
              ),
              child: CustomText(
                size,
                fontSize: 12,
                // color: Colors.black,
                color: isSelected ? Colors.white : AppColors.background,
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
