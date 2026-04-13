import 'package:flutter/material.dart';
import 'package:myapp/core/constants/app_font.dart';
import 'package:myapp/core/constants/app_strings.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/core/responsive/size_extention.dart';

class DealContainer extends StatelessWidget {

  String    title,
  subTitle;
  Color color;
  VoidCallback onPress;

   DealContainer({super.key,
    required this.title,
    required this.subTitle,
    required this.color,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      // height: context.hp(10),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10)),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                title,
                fontSize: 16,
                // fontWeight: FontWeight.w600,
                fontFamily: AppFonts.montserratMedium,
                color: Colors.white,
                maxLines: 1,
              ),
              SizedBox(
                height: context.hp(1.5),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.alarm,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: context.wp(0.8),
                  ),
                  CustomText(
                    subTitle,
                    fontSize: 12,
                    // fontWeight: FontWeight.w600,
                    fontFamily: AppFonts.montserratRegular,
                    color: Colors.white,
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: onPress,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Row(
                children: [
                  CustomText(
                    AppString.viewAll,
                    fontSize: 12,
                    // fontWeight: FontWeight.w600,
                    fontFamily: AppFonts.montserratSemiBold,
                    color: Colors.white,
                    maxLines: 1,
                  ),
                  SizedBox(
                    width: context.wp(0.91),
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
