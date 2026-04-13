import 'package:flutter/material.dart';
import 'package:myapp/core/custom_widgets/image.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/core/responsive/size_extention.dart';
import 'package:myapp/screens/cart/widgets/app_rating.dart';
import 'package:myapp/screens/cart/widgets/app_tag.dart';

class CheckoutItemCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final double oldPrice;
  final double rating;
  final List<String> variations;

  const CheckoutItemCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.variations,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(context.wp(4)),
        child: Column(
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: CustomImage(
                      imageUrl,
                      height: context.hp(12),
                      // width: context.wp(26),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                // CustomImage(
                //   imageUrl,
                //   width: context.wp(10),
                //   height: context.hp(1),
                //   // radius: context.sp(12),
                // ),
                SizedBox(width: context.wp(2),),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title,
                        // style: AppTextStyle.subtitle,
                      ),
                      SizedBox(height: context.hp(1)), // spacing after title

                      //VARIATION ROW
                      Row(
                        children: [
                          const CustomText(
                            "Variations: ",
                            // style: AppTextStyle.subtitle,
                          ),
                          Wrap(
                            spacing: context.sp(6),
                            children: variations
                                .map(
                                  (v) => AppTag(text: v),
                            )
                                .toList(),
                          ),
                        ],
                      ),

                      SizedBox(height: context.hp(1),),
                      AppRating(rating: rating),
                      SizedBox(height: context.hp(1),),
                      //PRICE ROW
                      Row(
                        children: [
                          CustomText(
                            '\$${price.toStringAsFixed(2)}',
                            // style: AppTextStyle.price,
                          ),
                          SizedBox(width: context.wp(8),),
                          CustomText(
                            '\$${oldPrice.toStringAsFixed(2)}',
                            // style: AppTextStyle.strike,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: context.hp(1),),
            Divider(height: context.hp(1),),
            SizedBox(height: context.hp(1),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  'Total Order (1) :',
                  // style: AppTextStyle.caption,
                ),
                CustomText(
                  '\$${price.toStringAsFixed(2)}',
                  // style: AppTextStyle.price,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
