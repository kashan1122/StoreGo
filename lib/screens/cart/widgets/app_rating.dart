import 'package:flutter/material.dart';

class AppRating extends StatelessWidget {
  final double rating; // e.g., 4.5
  final double size;   // size of each star
  final Color color;   // color of filled stars

  const AppRating({
    super.key,
    required this.rating,
    this.size = 16,
    this.color = Colors.amber,
  });

  @override
  Widget build(BuildContext context) {
    // Round rating to nearest 0.5
    final int fullStars = rating.floor();
    final bool hasHalfStar = (rating - fullStars) >= 0.5;
    final int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Full stars
        for (int i = 0; i < fullStars; i++)
          Icon(Icons.star, color: color, size: size),
        // Half star
        if (hasHalfStar)
          Icon(Icons.star_half, color: color, size: size),
        // Empty stars
        for (int i = 0; i < emptyStars; i++)
          Icon(Icons.star_border, color: color, size: size),
      ],
    );
  }
}
