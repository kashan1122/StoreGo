import 'package:flutter/material.dart';
import 'package:myapp/core/constants/app_font.dart';
import 'package:myapp/core/constants/app_strings.dart';
import 'package:myapp/core/custom_widgets/custom_gradient_container.dart';
import 'package:myapp/core/custom_widgets/image.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/core/responsive/size_extention.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  PageController pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, dynamic>> banners = [
    {
      "startColor": Color(0xFFFFC1CC),
      "endColor": Color(0xFFFF9EB8),
      "title": "50-40% OFF",
      "subtitle": "Now in (product)\nAll colours",
      "image": "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_t.png"
    },
    {
      "startColor": Color(0xFFD1C4E9),
      "endColor": Color(0xFF9575CD),
      "title": "New Arrivals",
      "subtitle": "Trending Styles",
      "image": "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_t.png"
    },
    {
      "startColor": Color(0xFFB3E5FC),
      "endColor": Color(0xFF4FC3F7),
      "title": "Flash Sale",
      "subtitle": "Hurry up!",
      "image": "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_t.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.hp(27),
          child: PageView.builder(
            controller: pageController,
            itemCount: banners.length,
            onPageChanged: (value) {
              setState(() => currentIndex = value);
            },
            itemBuilder: (context, index) {
              final item = banners[index];
              return AppGradientContainer(
                startColor: item["startColor"],
                endColor: item["endColor"],
                padding: const EdgeInsets.all(20),
                borderRadius: 25,
                child: Row(
                  children: [
                    // LEFT TEXT
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          CustomText(
                            item["title"],
                            fontSize: 22,
                            fontFamily: AppFonts.montserratBold,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            color: Colors.white,
                          ),


                          SizedBox(height: context.hp(1)),
                          CustomText(
                            item["subtitle"],
                            fontSize: 12,
                            fontFamily: AppFonts.montserratRegular,
                            // maxLines: 1,
                            textAlign: TextAlign.start,
                            color: Colors.white,
                          ),
                          SizedBox(height: context.hp(2)),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child:  Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomText(
                                  AppString.shopNow,
                                  fontSize: 12,
                                  fontFamily: AppFonts.montserratSemiBold,
                                  // maxLines: 1,
                                  textAlign: TextAlign.start,
                                  color: Colors.white,
                                ),
                                // SizedBox(width: 8),
                                SizedBox(width: context.wp(1),),
                                const Icon(Icons.arrow_forward,
                                    color: Colors.white, size: 20),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    // RIGHT IMAGE
                    Expanded(
                      flex: 5,
                      child:  CustomImage(
                        item["image"],
                        width: double.infinity,
                        height: context.hp(25),
                        fit: BoxFit.cover,
                      ),
                      // Image.asset(
                      //   item["image"],
                      //   fit: BoxFit.contain,
                      // ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        SizedBox(height: context.hp(2)),

        // PAGE INDICATOR
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            banners.length,
                (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: currentIndex == index ? 12 : 8,
              height: currentIndex == index ? 12 : 8,
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? Colors.pink
                    : Colors.grey.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
            ),
          ),
        )
      ],
    );
  }
}