import 'package:flutter/material.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/core/responsive/size_extention.dart';

class DeliveryAddressSection extends StatelessWidget {
  const DeliveryAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.location_on_outlined),
            SizedBox(width: context.wp(8)),
            const CustomText(
              'Delivery Address',
              // style: AppTextStyle.title,
            ),
          ],
        ),
        SizedBox(width: context.hp(12)),
        Container(
          // width: context.wp(6),
          height: context.hp(13),
          child: Row(
            children: [
              Expanded(
                flex:3,
                child: Card(
                  elevation: 2,
                  child: Padding(
                    padding: EdgeInsets.all(context.wp(3)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          'Address :',
                          // style: AppTextStyle.caption,
                        ),
                        SizedBox(width: context.hp(4)),
                        const CustomText(
                          '216 St Paul\'s Rd, London N1 2LL, UK',
                          maxLines: 2,
                          // style: AppTextStyle.body,
                        ),
                        SizedBox(width: context.hp(6)),
                         CustomText(
                          'Contact : +44-784232',
                          maxLines: 1,
                          // decoration: TextStyle(),
                          // style: AppTextStyle.caption,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: context.wp(2)),
              Expanded(
                flex: 1,
                child: Card(
                  elevation: 2,

                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: context.sp(28),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
