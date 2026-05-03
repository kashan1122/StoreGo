// import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
// import 'package:flutter/material.dart';
// import 'package:myapp/core/constants/app_assets_path.dart';
//
// // import '../constants/app_assets.dart';
// import '../constants/app_colors.dart';
//
// class CustomFancyShimmerImage extends StatelessWidget {
//   final String? errorImage;
//   final String imageUrl;
//   final bool? isFullUrl, isBase64Image;
//   final BoxFit fit;
//   final BoxFit? errorImageBoxFit;
//
//   const CustomFancyShimmerImage(
//       {Key? key,
//       required this.imageUrl,
//       this.fit = BoxFit.cover,
//       this.isFullUrl,
//       this.errorImage,
//       this.errorImageBoxFit,
//       this.isBase64Image = false})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     //print("image url is "+  NetworkStrings.NETWORK_IMAGE_BASE_URL+(imageUrl??""));
//
//     return
//         /*   ((isBase64Image??false)&&(Uri.parse(imageUrl??"").data?.isBase64==true))?
//     //  (Uri.parse(imageUrl??"").data?.isBase64==true)?
//     Image.memory(Uri.parse(imageUrl??"").data!.contentAsBytes(),fit: BoxFit.cover,):*/
//
//         FancyShimmerImage(
//       boxFit: fit,
//       shimmerBackColor: Colors.green,
//       shimmerHighlightColor: Colors.white,
//       imageUrl: imageUrl,
//       /*   isFullUrl??false?
//         imageUrl??"":
//         NetworkStrings.NETWORK_IMAGE_BASE_URL+(imageUrl??""),*/
//       errorWidget: Image.asset(
//         errorImage ?? AppAssets.onBoardingThree,
//         fit: errorImageBoxFit ?? BoxFit.contain,
//       ),
//     );
//   }
// }
