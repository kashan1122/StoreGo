import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const CustomImage(
      this.url, {
        super.key,
        this.width,
        this.height,
        this.fit,
      });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
    );
  }
}
