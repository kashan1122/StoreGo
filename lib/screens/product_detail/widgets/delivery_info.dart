import 'package:flutter/material.dart';
import 'package:myapp/core/constants/app_font.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/core/responsive/size_extention.dart';

class DeliveryInfo extends StatelessWidget {
  final BuildContext context;
  const DeliveryInfo(this.context, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.wp(4)),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const CustomText(
        "Delivery in 1 within Hour",
        fontSize: 16,
        fontFamily: AppFonts.montserratSemiBold,
      ),
    );
  }
}
