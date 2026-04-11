import 'package:flutter/material.dart';
import 'package:myapp/core/custom_widgets/image.dart';
import 'package:myapp/core/responsive/size_extention.dart';

class ProductImageSlider extends StatelessWidget {
  final BuildContext context;
  final String imageURL;
  const ProductImageSlider(this.context, this.imageURL, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CustomImage(
            imageURL,
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
