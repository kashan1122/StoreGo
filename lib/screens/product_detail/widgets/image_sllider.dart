import 'package:flutter/material.dart';
import 'package:myapp/core/custom_widgets/image.dart';
import 'package:myapp/core/responsive/size_extention.dart';

class ProductImageSlider extends StatelessWidget {
  final BuildContext context;
  const ProductImageSlider(this.context, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CustomImage(
            "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
            height: context.hp(35),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 10,
          top: context.hp(15),
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.chevron_right),
          ),
        ),
      ],
    );
  }
}
