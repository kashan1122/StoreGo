

import 'package:flutter/material.dart';
import 'package:myapp/core/constants/app_font.dart';
import 'package:myapp/core/constants/app_strings.dart';
import 'package:myapp/core/custom_widgets/image.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/core/responsive/size_extention.dart';

class OfferContainer extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const OfferContainer(
      this.url, {
        super.key,
        this.width,
        this.height,
        this.fit,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
// height: context.hp(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            children: [
//Image
              CustomImage(
                url,
                height: context.hp(9),
                fit: BoxFit.contain,
              ),
              SizedBox(
                width: context.wp(5),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText(
                    AppString.specialOffers,
                    fontSize: 16,
                    fontFamily: AppFonts.montserratMedium,
                    color: Colors.black,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: context.hp(2),
                  ),
                  const CustomText(
// AppString.weMakeSure,
                    "We make sure you get\nthe offer you need at best prices",
                    fontSize: 16,
                    fontFamily: AppFonts.montserratLight,
                    color: Colors.black,
                    maxLines: 2,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
