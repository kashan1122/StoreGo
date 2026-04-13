import 'package:flutter/material.dart';
import 'package:myapp/core/constants/app_colors.dart';
import 'package:myapp/core/constants/app_font.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/core/responsive/size_extention.dart';

class PromoBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onTap;
  final String image;
  final Color buttonColor;

  const PromoBanner({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onTap,
    required this.image,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Container(
          // height: context.hp(24),
          padding: EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10),
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child:Container(
            // width: double.infinity
            padding: EdgeInsets.symmetric(
              horizontal: context.wp(4),
              vertical: context.hp(2),
            ),
            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                /// ---------------- LEFT IMAGE + GOLD EFFECT ----------------
                Container(
                  width: context.wp(20),
                  height: context.hp(20),
                  child:
                  Image.network(
                    image,
                    width: double.infinity,
                    height: context.hp(23),
                    fit: BoxFit.contain,
                  ),
                  // Image.asset(
                  //   image,
                  //   fit: BoxFit.contain,
                  // ),
                ),

                /// ---------------- RIGHT TEXT + BUTTON ----------------
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      title,
                      fontSize: context.sp(20),
                      fontFamily: AppFonts.montserratMedium,
                    ),
                    SizedBox(height: context.hp(1)),

                    CustomText(
                      subtitle,
                      fontSize: context.sp(10),
                      fontFamily: AppFonts.montserratRegular,
                      color: Colors.black54,
                    ),

                    SizedBox(height: context.hp(2)),

                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.wp(6),
                          vertical: context.hp(1.4),
                        ),
                        decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomText(
                              buttonText,
                              fontSize: context.sp(14),
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            SizedBox(width: context.wp(2)),
                            const Icon(Icons.arrow_forward, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          child: Container(
            width: context.wp(3),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffF9D976),
                  Color(0xffF39F86)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),),
      ],
    );
  }
}
