// import 'package:flutter/material.dart';
//
// class CustomImage extends StatelessWidget {
//   final String imageUrl;
//   final double borderRadius;
//   final double aspectRatio; // 1.0 = square, 0.75 = portrait, etc.
//
//   const CustomImage({
//     super.key,
//     required this.imageUrl,
//     this.borderRadius = 12,
//     this.aspectRatio = 1,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: aspectRatio,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(borderRadius),
//         child: Image.network(
//           imageUrl,
//           fit: BoxFit.fill,
//           errorBuilder: (_, __, ___) => Container(
//             color: Colors.grey.shade300,
//             child: const Icon(Icons.broken_image, size: 40),
//           ),
//           loadingBuilder: (context, child, loadingProgress) {
//             if (loadingProgress == null) return child;
//             return Center(
//               child: CircularProgressIndicator(
//                 strokeWidth: 2,
//                 value: loadingProgress.expectedTotalBytes != null
//                     ? loadingProgress.cumulativeBytesLoaded /
//                     (loadingProgress.expectedTotalBytes ?? 1)
//                     : null,
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }



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
