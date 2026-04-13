import 'package:flutter/material.dart';

class AppGradientContainer extends StatelessWidget {
  final Widget child;
  final Color startColor;
  final Color endColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const AppGradientContainer({
    super.key,
    required this.child,
    required this.startColor,
    required this.endColor,
    this.borderRadius = 20,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            startColor.withOpacity(0.8),
            endColor.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
