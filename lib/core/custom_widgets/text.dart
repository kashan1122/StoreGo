import 'package:flutter/material.dart';
import 'package:myapp/core/constants/app_font.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final Color? color;
  final TextAlign textAlign;
  final int? maxLines;

  // ➕ NEW
  final TextDecoration? decoration;
  final Color? decorationColor;
  final double? decorationThickness;

  const CustomText(
      this.text, {
        super.key,
        this.fontSize,
        this.fontWeight,
        this.fontFamily,
        this.color,
        this.textAlign = TextAlign.start,
        this.maxLines,
        this.decoration,             // NEW
        this.decorationColor,        // NEW
        this.decorationThickness,    // NEW
      });

  @override
  Widget build(BuildContext context) {
    double responsiveFont =
    fontSize != null ? fontSize! * MediaQuery.of(context).textScaleFactor : 16;

    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(
        color: color ?? Theme.of(context).textTheme.bodyLarge!.color,
        fontSize: responsiveFont,
        fontFamily: fontFamily ?? AppFonts.montserratRegular,
        fontWeight: fontWeight,
        decoration: decoration,                     // NEW
        decorationColor: decorationColor,           // NEW
        decorationThickness: decorationThickness,   // NEW
      ),
    );
  }
}
