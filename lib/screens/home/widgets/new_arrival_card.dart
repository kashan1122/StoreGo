import 'package:flutter/material.dart';
import 'package:myapp/core/constants/app_strings.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/core/responsive/size_extention.dart';


class NewArrival extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const NewArrival({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: context.hp(1),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.wp(3)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ---------------------------
          // TOP IMAGE SECTION
          // ---------------------------
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(context.wp(3)),
              topRight: Radius.circular(context.wp(3)),
            ),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: context.hp(23),
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: context.hp(2)),

          // ---------------------------
          // TEXT + BUTTON ROW
          // ---------------------------
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.wp(4)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TEXTS
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: context.hp(0.5)),
                      CustomText(
                        subtitle,
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),

                // VIEW ALL BUTTON
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: context.hp(1),
                      horizontal: context.wp(4),
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffE74D57),
                      borderRadius: BorderRadius.circular(context.wp(3)),
                    ),
                    child: Row(
                      children: [
                        CustomText(
                          AppString.viewAll,
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(width: context.wp(1)),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: context.wp(5),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: context.hp(2)),
        ],
      ),
    );
  }
}
