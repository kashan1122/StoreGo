import 'package:flutter/material.dart';
import 'package:myapp/core/constants/app_strings.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/core/responsive/size_extention.dart';


class SponsoredCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onTap;

  const SponsoredCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.wp(3),
        vertical: context.hp(1),
      ),
      padding: EdgeInsets.all(context.wp(3)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.wp(3)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            spreadRadius: 1,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔥 TITLE “Sponsored”
          CustomText(
            AppString.sponsored,
            fontSize: context.sp(18),
            fontWeight: FontWeight.w600,
          ),

          SizedBox(height: context.hp(1)),

          /// 🔥 IMAGE Section
          ClipRRect(
            borderRadius: BorderRadius.circular(context.wp(3)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                /// MAIN IMAGE
                // Image.asset(
                //   imageUrl,
                //   width: double.infinity,
                //   height: context.hp(30),
                //   fit: BoxFit.cover,
                // ),
                Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: context.hp(23),
                  fit: BoxFit.cover,
                ),

                /// "UP TO 50% OFF" TEXT OVERLAY
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      AppString.upTo,
                      fontSize: context.sp(18),
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    CustomText(
                      "50% ${AppString.off}",
                      fontSize: context.sp(32),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: context.hp(2)),

          /// 🔥 FOOTER TITLE + ARROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                title,
                fontSize: context.sp(16),
                fontWeight: FontWeight.w600,
              ),

              InkWell(
                onTap: onTap,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: context.sp(18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
