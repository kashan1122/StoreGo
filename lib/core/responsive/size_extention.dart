import 'package:flutter/material.dart';

extension SizeExtensions on BuildContext {
  double get w => MediaQuery.sizeOf(this).width;
  double get h => MediaQuery.sizeOf(this).height;

  double sp(double size) =>
      (MediaQuery.of(this).size.width / 100) * (size / 3);
  double wp(double percent) => w * (percent / 100);
  double hp(double percent) => h * (percent / 100);
}
